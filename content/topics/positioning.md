---
title: "Positioning"
description: "static, relative, absolute, fixed, sticky"
weight: 8
iconId: "icon-position"
---

`position` breaks elements out of normal flow so you can place them exactly where you want.

## static (default)

The default. Elements flow in document order. `top`, `left`, and the rest have no effect here.

## relative

Stays in the flow but can be nudged with `top`/`right`/`bottom`/`left`, relative to where it would normally sit. Its original space stays reserved.

{{< demo height="160" >}}
<style>
  .row { display:flex; gap:8px; align-items:flex-start; padding:16px; background:var(--ds-surface); border-radius:6px; }
  .box { width:70px; height:50px; background:#7c3aed; color:#fff; display:flex; align-items:center; justify-content:center; border-radius:4px; font-weight:bold; }
  .moved { position: relative; top: 16px; left: 12px; background: #a78bfa; }
</style>
<div class="row">
  <div class="box">1</div>
  <div class="box moved">2</div>
  <div class="box">3</div>
</div>
<p style="font-size:.8rem;color:var(--ds-muted);margin-top:8px">Box 2 is nudged, its original space stays reserved, so Box 3 is not displaced.</p>
{{< /demo >}}

## absolute

Pulled out of the flow entirely. Positions against the nearest ancestor with a non-`static` position. If there isn't one, it falls back to the page root.

{{< demo height="180" >}}
<style>
  .parent {
    position: relative;
    width: 260px; height: 120px;
    background: #ede9fe;
    border: 2px solid #7c3aed;
    border-radius: 6px;
  }
  .badge {
    position: absolute;
    top: -10px;
    right: -10px;
    background: tomato;
    color: #fff;
    width: 28px; height: 28px;
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-weight: bold; font-size: .85rem;
  }
  .label { padding: 14px; font-weight: 600; color: #3b0764; font-size: .9rem; }
</style>
<div class="parent">
  <div class="label">position: relative</div>
  <div class="badge">3</div>
</div>
<p style="font-size:.8rem;color:var(--ds-muted);margin-top:8px">The badge sits at top-right of the parent because the parent is <code>position: relative</code>.</p>
{{< /demo >}}

## fixed

Like `absolute`, but relative to the viewport. Stays put when the page scrolls. Good for fixed headers and floating buttons.

```css
.sticky-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;       /* stretch full width */
  z-index: 100;
}
```

## sticky

Sits in the flow like `relative`, but locks to a scroll position once you scroll past it.

```css
th {
  position: sticky;
  top: 0;         /* stick to top of scroll container */
}
```

## z-index

Higher `z-index` = closer to the viewer. Only works on positioned elements (anything but `static`).

{{< demo height="160" >}}
<style>
  .stack { position: relative; height: 100px; }
  .layer {
    position: absolute;
    width: 100px; height: 70px;
    border-radius: 8px;
    display: flex; align-items: center; justify-content: center;
    font-weight: bold; color: #fff;
  }
  .l1 { background: #7c3aed; top: 10px; left: 10px; z-index: 1; }
  .l2 { background: #a78bfa; top: 30px; left: 50px; z-index: 2; }
  .l3 { background: #5b21b6; top: 20px; left: 100px; z-index: 3; }
</style>
<div class="stack">
  <div class="layer l1">z:1</div>
  <div class="layer l2">z:2</div>
  <div class="layer l3">z:3</div>
</div>
{{< /demo >}}

## Quick reference

| Value | In flow? | Positioned relative to |
|---|---|---|
| `static` | yes | — |
| `relative` | yes | itself |
| `absolute` | no | nearest positioned ancestor |
| `fixed` | no | viewport |
| `sticky` | yes → no | scroll container |
