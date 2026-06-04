---
title: "Flexbox"
description: "Row or column layout with display: flex"
weight: 5
iconId: "icon-layout"
---

Flexbox is a layout model for arranging items in a single row or column. Add `display: flex` to a container and its direct children become *flex items*.

## The basics

{{< demo height="100" >}}
<style>
  .row {
    display: flex;
    gap: 8px;
    background: #ede9fe;
    padding: 12px;
    border-radius: 6px;
  }
  .item {
    background: #7c3aed;
    color: #fff;
    padding: 10px 18px;
    border-radius: 4px;
    font-weight: bold;
  }
</style>
<div class="row">
  <div class="item">A</div>
  <div class="item">B</div>
  <div class="item">C</div>
</div>
{{< /demo >}}

## flex-direction

Default is `row`. Set it to `column` to stack items vertically.

{{< demo height="220" >}}
<style>
  .flex { display:flex; gap:6px; background:#f3f4f6; padding:10px; border-radius:6px; margin-bottom:8px; }
  .flex.col { flex-direction: column; }
  .i { background:#7c3aed; color:#fff; padding:8px 14px; border-radius:4px; font-weight:bold; }
  small { color:#666; font-size:.75rem; }
</style>
<small>flex-direction: row (default)</small>
<div class="flex">
  <div class="i">A</div><div class="i">B</div><div class="i">C</div>
</div>
<small>flex-direction: column</small>
<div class="flex col">
  <div class="i">A</div><div class="i">B</div><div class="i">C</div>
</div>
{{< /demo >}}

## justify-content

Distributes items along the **main axis** (horizontal in row, vertical in column).

{{< demo height="320" >}}
<style>
  .f { display:flex; gap:6px; background:#f3f4f6; padding:8px; border-radius:6px; margin-bottom:6px; }
  .i { background:#7c3aed; color:#fff; padding:8px 14px; border-radius:4px; font-weight:bold; }
  small { color:#666; font-size:.75rem; display:block; margin-top:4px; }
</style>
<small>flex-start (default)</small>
<div class="f" style="justify-content:flex-start"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
<small>center</small>
<div class="f" style="justify-content:center"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
<small>flex-end</small>
<div class="f" style="justify-content:flex-end"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
<small>space-between</small>
<div class="f" style="justify-content:space-between"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
<small>space-around</small>
<div class="f" style="justify-content:space-around"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
{{< /demo >}}

## align-items

Aligns items along the **cross axis** (vertical in row).

{{< demo height="300" >}}
<style>
  .f { display:flex; gap:6px; background:#f3f4f6; padding:8px; border-radius:6px; margin-bottom:6px; height:70px; }
  .i { background:#7c3aed; color:#fff; padding:8px 14px; border-radius:4px; font-weight:bold; }
  .tall { height:50px; display:flex; align-items:center; }
  small { color:#666; font-size:.75rem; display:block; }
</style>
<small>flex-start</small>
<div class="f" style="align-items:flex-start"><div class="i">A</div><div class="i tall">B</div><div class="i">C</div></div>
<small>center</small>
<div class="f" style="align-items:center"><div class="i">A</div><div class="i tall">B</div><div class="i">C</div></div>
<small>flex-end</small>
<div class="f" style="align-items:flex-end"><div class="i">A</div><div class="i tall">B</div><div class="i">C</div></div>
<small>stretch (default)</small>
<div class="f" style="align-items:stretch"><div class="i">A</div><div class="i">B</div><div class="i">C</div></div>
{{< /demo >}}

## flex-wrap

By default items don't wrap. `flex-wrap: wrap` lets them flow to the next row.

{{< demo height="160" >}}
<style>
  .wrap { display:flex; flex-wrap:wrap; gap:6px; background:#f3f4f6; padding:8px; border-radius:6px; max-width:280px; }
  .i { background:#7c3aed; color:#fff; padding:8px 14px; border-radius:4px; font-weight:bold; }
</style>
<div class="wrap">
  <div class="i">Apple</div>
  <div class="i">Banana</div>
  <div class="i">Cherry</div>
  <div class="i">Date</div>
  <div class="i">Elderberry</div>
</div>
{{< /demo >}}

## flex-grow, flex-shrink, flex-basis

Three properties control how items share available space:

- `flex-grow: 1`: the item claims any leftover space
- `flex-shrink: 0`: the item won't shrink below its natural size
- `flex-basis: 200px`: the starting size, before grow/shrink applies

Shorthand: `flex: grow shrink basis`

{{< demo height="100" >}}
<style>
  .f { display:flex; gap:6px; background:#f3f4f6; padding:8px; border-radius:6px; }
  .i { background:#7c3aed; color:#fff; padding:8px 12px; border-radius:4px; font-weight:bold; font-size:.85rem; }
</style>
<div class="f">
  <div class="i" style="flex:0 0 80px">fixed 80px</div>
  <div class="i" style="flex:1">flex:1 (grows)</div>
  <div class="i" style="flex:2">flex:2 (grows 2×)</div>
</div>
{{< /demo >}}

## Centering trick

The quickest way to center something in both directions:

```css
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

{{< demo height="130" >}}
<style>
  .center-demo {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100px;
    background: #ede9fe;
    border-radius: 8px;
  }
  .box {
    background: #7c3aed;
    color: #fff;
    padding: 14px 24px;
    border-radius: 6px;
    font-weight: bold;
  }
</style>
<div class="center-demo">
  <div class="box">Perfectly centered</div>
</div>
{{< /demo >}}
