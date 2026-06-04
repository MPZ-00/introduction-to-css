---
title: "Colors"
description: "Named, hex, RGB, HSL: every format CSS supports"
weight: 3
iconId: "icon-palette"
---

CSS has several color formats. They're interchangeable, so use whichever is easiest to read.

## Named colors

CSS has 140+ named colors. Good for quick demos, but not precise enough for production.

{{< demo height="100" >}}
<style>
  .swatches { display: flex; gap: 8px; flex-wrap: wrap; }
  .sw { width: 60px; height: 40px; border-radius: 6px; display: flex; align-items: center; justify-content: center; font-size: .65rem; font-weight: bold; }
</style>
<div class="swatches">
  <div class="sw" style="background:tomato;color:#fff">tomato</div>
  <div class="sw" style="background:steelblue;color:#fff">steel blue</div>
  <div class="sw" style="background:gold">gold</div>
  <div class="sw" style="background:mediumseagreen;color:#fff">seagreen</div>
  <div class="sw" style="background:orchid;color:#fff">orchid</div>
  <div class="sw" style="background:coral;color:#fff">coral</div>
</div>
{{< /demo >}}

## Hex colors

Six hex digits: `#RRGGBB`. Each pair is a channel from `00` (none) to `ff` (full). Can be shortened to three digits when both digits are the same: `#aabbcc` → `#abc`.

{{< demo height="110" >}}
<style>
  .row { display:flex; gap:8px; flex-wrap:wrap; }
  .h  { width:70px; height:44px; border-radius:6px; display:flex; align-items:center; justify-content:center; font-size:.7rem; font-weight:bold; }
</style>
<div class="row">
  <div class="h" style="background:#e74c3c;color:#fff">#e74c3c</div>
  <div class="h" style="background:#3498db;color:#fff">#3498db</div>
  <div class="h" style="background:#2ecc71">#2ecc71</div>
  <div class="h" style="background:#f39c12">#f39c12</div>
  <div class="h" style="background:#9b59b6;color:#fff">#9b59b6</div>
  <div class="h" style="background:#1abc9c;color:#fff">#1abc9c</div>
</div>
{{< /demo >}}

## rgb() and rgba()

`rgb(red, green, blue)`: each channel runs 0–255. `rgba()` adds an alpha channel (0 = transparent, 1 = opaque).

{{< demo height="130" >}}
<style>
  .alpha-demo { display:flex; gap:10px; align-items:flex-end; }
  .a { height:60px; width:60px; border-radius:6px; display:flex; align-items:center; justify-content:center; font-size:.7rem; font-weight:bold; color:#fff; }
</style>
<div class="alpha-demo">
  <div class="a" style="background:rgba(124,58,237,1.0)">α 1.0</div>
  <div class="a" style="background:rgba(124,58,237,0.75)">α .75</div>
  <div class="a" style="background:rgba(124,58,237,0.5)">α .5</div>
  <div class="a" style="background:rgba(124,58,237,0.25);color:#333">α .25</div>
  <div class="a" style="background:rgba(124,58,237,0);border:1px solid #ccc;color:#333">α 0</div>
</div>
{{< /demo >}}

## hsl() and hsla()

`hsl(hue, saturation%, lightness%)` is easier to reason about than RGB:
- Hue 0–360: position on the color wheel (0=red, 120=green, 240=blue)
- Saturation 0–100%: 0% is grey, 100% is full color
- Lightness 0–100%: 0% is black, 100% is white

{{< demo height="160" >}}
<style>
  .hue-row { display:flex; gap:6px; flex-wrap:wrap; margin-bottom:8px; }
  .hb { width:48px; height:40px; border-radius:6px; }
  .sat-row { display:flex; gap:6px; }
  .sb { width:48px; height:30px; border-radius:6px; font-size:.65rem; display:flex; align-items:center; justify-content:center; }
</style>
<!-- Full hue wheel -->
<div class="hue-row">
  <div class="hb" style="background:hsl(0,80%,55%)"></div>
  <div class="hb" style="background:hsl(40,80%,55%)"></div>
  <div class="hb" style="background:hsl(80,80%,45%)"></div>
  <div class="hb" style="background:hsl(120,60%,45%)"></div>
  <div class="hb" style="background:hsl(180,60%,40%)"></div>
  <div class="hb" style="background:hsl(220,70%,55%)"></div>
  <div class="hb" style="background:hsl(270,70%,55%)"></div>
  <div class="hb" style="background:hsl(320,70%,55%)"></div>
</div>
<!-- Varying lightness on one hue -->
<div class="sat-row">
  <div class="sb" style="background:hsl(240,80%,20%);color:#fff">20%</div>
  <div class="sb" style="background:hsl(240,80%,35%);color:#fff">35%</div>
  <div class="sb" style="background:hsl(240,80%,50%);color:#fff">50%</div>
  <div class="sb" style="background:hsl(240,80%,65%);color:#fff">65%</div>
  <div class="sb" style="background:hsl(240,80%,80%)">80%</div>
  <div class="sb" style="background:hsl(240,80%,93%)">93%</div>
</div>
{{< /demo >}}

## CSS custom properties (variables)

Define once with `--name: value;` on a selector (usually `:root`), use anywhere with `var(--name)`.

{{< demo height="160" >}}
<style>
  :root {
    --brand: #7c3aed;
    --brand-light: #ede9fe;
    --gap: 12px;
  }

  .card {
    background: var(--brand-light);
    border-left: 4px solid var(--brand);
    padding: var(--gap);
    border-radius: 6px;
    color: var(--brand);
    font-weight: bold;
    margin-bottom: var(--gap);
  }
</style>
<div class="card">Card one</div>
<div class="card">Card two — both use the same variable</div>
{{< /demo >}}

Change `--brand` once and everything using it updates. That's the whole trick behind CSS theming.
