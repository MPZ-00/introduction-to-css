<#
.SYNOPSIS
    Builds a Hugo site and deploys the output to a GitHub Pages branch.

.DESCRIPTION
    Builds the Hugo site with --gc --minify, then pushes the public/ directory
    to a separate git branch using a fresh ephemeral repo.
    All project-specific values (remote URL, site URL, theme submodule) are
    auto-detected from the repo ─ no constants to update when reusing this script.

.PARAMETER Path
    Path to the Hugo project root. Defaults to the current directory.

.PARAMETER Branch
    Target branch for the GitHub Pages deployment. Defaults to 'public'.

.EXAMPLE
    DeployToPublicBranch.ps1
    Deploys from the current directory to the 'public' branch.

.EXAMPLE
    DeployToPublicBranch.ps1 -Path C:\Projects\my-hugo-site
    Deploys the specified project from anywhere.

.EXAMPLE
    DeployToPublicBranch.ps1 -Branch gh-pages
    Deploys to the 'gh-pages' branch instead.
#>

param(
	[string]$Path = ".",
	[string]$Branch = "public"
)

# Resolve and validate project root
$projectRoot = Resolve-Path $Path -ErrorAction SilentlyContinue
if (-not $projectRoot) {
	Write-Host "Error: Path '$Path' not found." -ForegroundColor Red
	exit 1
}
if (-not (Test-Path (Join-Path $projectRoot "hugo.toml"))) {
	Write-Host "Error: hugo.toml not found in '$projectRoot'. Is this a Hugo project?" -ForegroundColor Red
	exit 1
}

Push-Location $projectRoot
try {

	# --- Auto-detect project values ---

	$remoteUrl = git remote get-url origin 2>$null
	if (-not $remoteUrl) {
		Write-Host "Error: No 'origin' remote found. Add one with: git remote add origin <url>" -ForegroundColor Red
		exit 1
	}

	# Site URL: prefer static/CNAME, fall back to baseURL in hugo.toml
	if (Test-Path "static/CNAME") {
		$siteUrl = "https://$((Get-Content 'static/CNAME' -Raw).Trim())"
	}
	elseif ((Get-Content "hugo.toml" -Raw) -match 'baseURL\s*=\s*"([^"]+)"') {
		$siteUrl = $Matches[1]
	}
	else {
		$siteUrl = $null
	}

	# Theme submodule: detect from .gitmodules, skip if absent
	$themeLayoutsPath = $null
	if (Test-Path ".gitmodules") {
		if ((Get-Content ".gitmodules" -Raw) -match 'path\s*=\s*(themes/[^\s\r\n]+)') {
			$themeLayoutsPath = $Matches[1] + "/layouts"
		}
	}

	# Optional project tool (resolved relative to project root, not this script)
	$hasUpdateIndices = Test-Path "tools\UpdateIndices.ps1"

	# --- Dynamic step count ---
	$totalSteps = 5  # clean, build, git-init, commit, push
	if ($themeLayoutsPath) { $totalSteps++ }
	if ($hasUpdateIndices) { $totalSteps++ }
	$currentStep = 0

	function Show-Step([string]$Message) {
		$script:currentStep++
		Write-Host "`n[$script:currentStep/$script:totalSteps] $Message" -ForegroundColor Cyan
	}

	Write-Host "Deploying to '$Branch' branch..." -ForegroundColor Green
	Write-Host "Project: $projectRoot"
	Write-Host "Remote : $remoteUrl"
	if ($siteUrl) { Write-Host "Site   : $siteUrl" }

	# --- Theme submodule (skipped if no .gitmodules or no theme path) ---
	if ($themeLayoutsPath) {
		Show-Step "Ensuring theme submodule is initialized..."
		if (-not (Test-Path $themeLayoutsPath)) {
			Write-Host "Theme files missing. Initializing submodules..." -ForegroundColor Yellow
			git submodule update --init --recursive
			if ($LASTEXITCODE -ne 0 -or -not (Test-Path $themeLayoutsPath)) {
				Write-Host "Error: Could not initialize theme submodule." -ForegroundColor Red
				exit 1
			}
		}
		Write-Host "Theme ready." -ForegroundColor Green
	}

	# --- Optional: project-specific index update ---
	if ($hasUpdateIndices) {
		Show-Step "Updating indices..."
		& ".\tools\UpdateIndices.ps1"
		if ($LASTEXITCODE -ne 0) {
			Write-Host "Warning: UpdateIndices failed; continuing." -ForegroundColor Yellow
		}
	}

	# --- Clean public/ ---
	Show-Step "Cleaning public/ directory..."
	if (Test-Path "public") {
		Remove-Item -Recurse -Force public
		Write-Host "Removed old public/." -ForegroundColor Yellow
	}

	# --- Hugo build ---
	Show-Step "Building Hugo site (--gc --minify)..."
	hugo --gc --minify
	if ($LASTEXITCODE -ne 0) {
		Write-Host "Error: Hugo build failed." -ForegroundColor Red
		exit 1
	}
	if (-not (Test-Path "public")) {
		Write-Host "Error: public/ not found after build." -ForegroundColor Red
		exit 1
	}
	Write-Host "Build successful." -ForegroundColor Green

	# --- Ephemeral git repo inside public/ ---
	Show-Step "Initializing git in public/..."
	Push-Location public
	$pushOk = $false
	try {
		git init
		git remote add origin $remoteUrl
		git checkout -b $Branch

		Show-Step "Committing build output..."
		git add -A
		git commit -m "deploy: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

		Show-Step "Pushing to '$Branch'..."
		git push -f origin $Branch
		$pushOk = ($LASTEXITCODE -eq 0)
	}
	finally {
		Pop-Location
	}

	# --- Result ---
	if ($pushOk) {
		Write-Host "`n=================================" -ForegroundColor Green
		Write-Host "Deployment successful!" -ForegroundColor Green
		if ($siteUrl) { Write-Host "Live at : $siteUrl" -ForegroundColor Green }
		Write-Host "=================================" -ForegroundColor Green
		Remove-Item -Recurse -Force public
	}
	else {
		Write-Host "`nError: Push failed. Check your git credentials and permissions." -ForegroundColor Red
		exit 1
	}

}
finally {
	Pop-Location
}
