---
title: "Box Model"
description: "How every element is sized and spaced"
weight: 2
iconId: "icon-box"
---

Every element is a box with four layers, from inside out: content, padding, border, margin.

## The four layers

{{< demo height="260" >}}
<style>
  .box {
    width: 140px;
    padding: 24px;
    border: 6px solid steelblue;
    margin: 20px auto;
    background: #dbeafe;
    text-align: center;
    font-size: 0.85rem;
    color: #1e3a5f;
  }
</style>
<div class="box">
  content<br>
  <small>(140 px wide)</small>
</div>
<p style="text-align:center;font-size:.8rem;color:#555">
  + 24px padding on each side<br>
  + 6px border on each side<br>
  + 20px margin on each side
</p>
{{< /demo >}}

- `padding`: space between the content and the border (background color fills here too)
- `border`: a line around the padding and content
- `margin`: transparent space outside the border that pushes neighboring elements away

## box-sizing

By default (`content-box`), `width` only covers the content area. Padding and border stack on top of that, making the element wider than you set. `border-box` folds them in, so what you write is what you get.

{{< demo height="200" >}}
<style>
  .content-box {
    box-sizing: content-box;   /* default */
    width: 200px;
    padding: 20px;
    border: 4px solid tomato;
    background: #fee2e2;
    margin-bottom: 12px;
  }
  .border-box {
    box-sizing: border-box;    /* better */
    width: 200px;
    padding: 20px;
    border: 4px solid steelblue;
    background: #dbeafe;
  }
</style>
<div class="content-box">content-box — total 248px wide</div>
<div class="border-box">border-box — total 200px wide</div>
{{< /demo >}}

Most projects apply `box-sizing: border-box` globally:

```css
*, *::before, *::after { box-sizing: border-box; }
```

## Margin collapse

Vertical margins between adjacent block elements *collapse*: only the larger one counts, not the sum.

{{< demo height="200" >}}
<style>
  .a { margin-bottom: 40px; background: #fde68a; padding: 8px; }
  .b { margin-top: 20px;    background: #bbf7d0; padding: 8px; }
  /* gap between a and b = 40px, not 60px */
</style>
<div class="a">Box A — margin-bottom: 40px</div>
<div class="b">Box B — margin-top: 20px</div>
<p style="font-size:.8rem;color:#666;margin-top:8px">
  Actual gap = 40px (the larger of the two), not 60px
</p>
{{< /demo >}}

Margin collapse only applies to block elements in normal flow. It doesn't happen inside flex or grid containers.

## Shorthand notation

All four sides at once, or each individually:

```css
/* All sides */
margin: 16px;

/* Top/bottom, left/right */
padding: 8px 16px;

/* Top, right, bottom, left (clockwise) */
border-width: 1px 2px 3px 4px;

/* Individual sides */
margin-top: 8px;
padding-left: 24px;
```

## width and height

By default, block elements stretch to fill their container's width. You can constrain them:

```css
.card {
  width: 300px;       /* fixed */
  max-width: 100%;    /* but never overflow the screen */
  min-height: 120px;  /* at least this tall */
}
```
