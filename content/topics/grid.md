---
title: "Grid"
description: "Place items in rows and columns at once"
weight: 6
iconId: "icon-grid-layout"
---

CSS Grid works in two dimensions. Flexbox handles a single row or column; Grid handles both at once.

## Defining a grid

`display: grid` plus `grid-template-columns` creates a grid. `gap` adds gutter space.

{{< demo height="160" >}}
<style>
  .grid {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;  /* three equal columns */
    gap: 8px;
  }
  .cell {
    background: #7c3aed;
    color: #fff;
    padding: 16px;
    border-radius: 6px;
    text-align: center;
    font-weight: bold;
  }
</style>
<div class="grid">
  <div class="cell">1</div>
  <div class="cell">2</div>
  <div class="cell">3</div>
  <div class="cell">4</div>
  <div class="cell">5</div>
  <div class="cell">6</div>
</div>
{{< /demo >}}

The `fr` unit means "fraction of available space". `1fr 1fr 1fr` is three equal columns. `2fr 1fr` gives the first column twice the space.

## repeat()

Avoid repetition with `repeat(count, size)`:

```css
/* same result as 1fr 1fr 1fr 1fr */
grid-template-columns: repeat(4, 1fr);
```

## Mixing units

{{< demo height="120" >}}
<style>
  .g2 {
    display: grid;
    grid-template-columns: 120px 1fr 2fr;
    gap: 8px;
  }
  .c { background:#ddd6fe; border-radius:6px; padding:12px 8px; text-align:center; font-size:.8rem; color:#3b0764; font-weight:600; }
</style>
<div class="g2">
  <div class="c">120px fixed</div>
  <div class="c">1fr</div>
  <div class="c">2fr (twice as wide)</div>
</div>
{{< /demo >}}

## Spanning cells

Use `grid-column` and `grid-row` to make a cell span multiple tracks.

{{< demo height="180" >}}
<style>
  .g3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-template-rows: 60px 60px;
    gap: 6px;
  }
  .c { background:#7c3aed; color:#fff; border-radius:6px; display:flex; align-items:center; justify-content:center; font-weight:bold; }
  .span2col { grid-column: span 2; background:#a78bfa; }
  .span2row { grid-row: span 2; background:#5b21b6; }
</style>
<div class="g3">
  <div class="c span2col">spans 2 columns</div>
  <div class="c span2row">spans 2 rows</div>
  <div class="c">3</div>
  <div class="c">4</div>
</div>
{{< /demo >}}

## grid-template-areas

Name your grid regions for a visual layout definition:

{{< demo height="220" >}}
<style>
  .page {
    display: grid;
    grid-template-columns: 160px 1fr;
    grid-template-rows: 44px 1fr 32px;
    grid-template-areas:
      "header  header"
      "sidebar main"
      "footer  footer";
    gap: 6px;
    height: 190px;
  }
  .page > * { border-radius:6px; display:flex; align-items:center; justify-content:center; font-size:.8rem; font-weight:bold; color:#fff; }
  .hdr  { grid-area: header;  background:#7c3aed; }
  .side { grid-area: sidebar; background:#a78bfa; }
  .main { grid-area: main;    background:#ddd6fe; color:#3b0764; }
  .ftr  { grid-area: footer;  background:#6d28d9; }
</style>
<div class="page">
  <div class="hdr">header</div>
  <div class="side">sidebar</div>
  <div class="main">main content</div>
  <div class="ftr">footer</div>
</div>
{{< /demo >}}

## auto-fill and auto-fit

Responsive grids without media queries:

```css
/* as many columns as fit, each at least 200px */
grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
```

{{< demo height="160" >}}
<style>
  .auto {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
    gap: 8px;
  }
  .c { background:#7c3aed; color:#fff; border-radius:6px; padding:16px; text-align:center; font-weight:bold; }
</style>
<div class="auto">
  <div class="c">A</div>
  <div class="c">B</div>
  <div class="c">C</div>
  <div class="c">D</div>
  <div class="c">E</div>
</div>
<p style="font-size:.75rem;color:var(--ds-muted);margin-top:6px">Resize the browser. Columns reflow automatically.</p>
{{< /demo >}}

## Grid vs Flexbox

Flexbox works best for a single row or column where items should adapt to their content.

Grid works best when you need both dimensions at once: page layouts, dashboards, card grids.

They work well together. Grid for the page structure, flex for the items inside.
