---
title: "Typography"
description: "Font family, size, weight, and line height"
weight: 4
iconId: "icon-typography"
---

Typography is the set of CSS properties that affect how text looks: font family, size, weight, and line height.

## font-family

List fonts in order. The browser picks the first one it can load. End with a generic fallback (`serif`, `sans-serif`, or `monospace`) so something always renders.

{{< demo height="180" >}}
<style>
  .sans  { font-family: system-ui, sans-serif; }
  .serif { font-family: Georgia, "Times New Roman", serif; }
  .mono  { font-family: "Consolas", "Fira Code", monospace; }
  p { margin: 4px 0; font-size: 1.1rem; }
</style>
<p class="sans">system-ui, sans-serif — clean and modern</p>
<p class="serif">Georgia, serif — classic editorial feel</p>
<p class="mono">Consolas, monospace — code and data</p>
{{< /demo >}}

## font-size

The most useful units:

| Unit | Meaning |
|---|---|
| `px` | absolute pixels |
| `rem` | relative to root font size (usually 16px) |
| `em` | relative to the *current* element's font size |
| `%` | percentage of parent font size |

{{< demo height="160" >}}
<style>
  .px16  { font-size: 16px; }
  .rem1  { font-size: 1rem; }    /* same as 16px with browser defaults */
  .rem15 { font-size: 1.5rem; }
  .rem2  { font-size: 2rem; }
  p { margin: 2px 0; }
</style>
<p class="px16">16px</p>
<p class="rem1">1rem (same as 16px)</p>
<p class="rem15">1.5rem</p>
<p class="rem2">2rem</p>
{{< /demo >}}

## font-weight

Numeric values from 100 (thin) to 900 (black). `400` = normal, `700` = bold.

{{< demo height="170" >}}
<style>
  p { margin: 3px 0; font-size: 1.1rem; font-family: system-ui; }
</style>
<p style="font-weight:300">font-weight: 300 — Light</p>
<p style="font-weight:400">font-weight: 400 — Regular (normal)</p>
<p style="font-weight:600">font-weight: 600 — SemiBold</p>
<p style="font-weight:700">font-weight: 700 — Bold</p>
<p style="font-weight:900">font-weight: 900 — Black</p>
{{< /demo >}}

## line-height

A unitless number like `1.5` scales with the font size, so `1rem` text and `2rem` headings both get proportional line spacing.

{{< demo height="220" >}}
<style>
  .tight  { line-height: 1;   background:#fee2e2; padding:8px; margin-bottom:8px; }
  .normal { line-height: 1.5; background:#dcfce7; padding:8px; margin-bottom:8px; }
  .loose  { line-height: 2.2; background:#dbeafe; padding:8px; }
</style>
<p class="tight">line-height: 1 — Tight. Lines are very close together and long text becomes hard to read quickly.</p>
<p class="normal">line-height: 1.5 — Comfortable. The standard for body text.</p>
<p class="loose">line-height: 2.2 — Loose. Airy, used in some editorial designs.</p>
{{< /demo >}}

## letter-spacing and word-spacing

{{< demo height="150" >}}
<style>
  p { margin: 6px 0; font-size: 1rem; }
  .label {
    letter-spacing: 0.12em;
    text-transform: uppercase;
    font-size: 0.75rem;
    font-weight: 700;
    color: #7c3aed;
  }
  .spread { letter-spacing: 0.3em; }
  .words  { word-spacing: 1em; }
</style>
<p class="label">Section label — wide letter-spacing</p>
<p class="spread">Spread apart letters</p>
<p class="words">Wide word spacing here</p>
{{< /demo >}}

## text-align and text-decoration

{{< demo height="200" >}}
<style>
  p { border-bottom: 1px solid var(--ds-border); padding: 4px 0; }
  .left   { text-align: left; }
  .center { text-align: center; }
  .right  { text-align: right; }
  .under  { text-decoration: underline; }
  .strike { text-decoration: line-through; color: #999; }
  .wavy   { text-decoration: underline wavy tomato; }
</style>
<p class="left">Left aligned (default)</p>
<p class="center">Center aligned</p>
<p class="right">Right aligned</p>
<p class="under">Underlined</p>
<p class="strike">Struck through</p>
<p class="wavy">Wavy underline in red</p>
{{< /demo >}}

## Google Fonts

Load any web font by adding a `<link>` in `<head>`:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
```

```css
body { font-family: 'Inter', sans-serif; }
```
