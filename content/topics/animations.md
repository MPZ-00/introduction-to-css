---
title: "Animations"
description: "Transitions and keyframe animations"
weight: 7
iconId: "icon-animation-14"
---

CSS can animate properties without JavaScript. Two tools: `transition` for state changes, `@keyframes` for sequences that run on their own.

## Transitions

`transition` interpolates a property when it changes, usually triggered by `:hover` or `:focus`.

```css
transition: property duration timing-function delay;
```

{{< demo height="130" >}}
<style>
  .btn {
    display: inline-block;
    padding: 12px 28px;
    background: #7c3aed;
    color: #fff;
    border-radius: 8px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.25s ease, transform 0.2s ease, box-shadow 0.25s ease;
  }
  .btn:hover {
    background: #5b21b6;
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(124,58,237,0.4);
  }
</style>
<div class="btn">Hover me</div>
{{< /demo >}}

### Timing functions

Each value produces a different feel. Hover the tracks to compare.

{{< demo height="220" >}}
<style>
  .bar { height: 36px; margin-bottom: 6px; display: flex; align-items: center; gap: 8px; }
  .track { flex: 1; height: 10px; background: #e5e7eb; border-radius: 99px; position: relative; overflow: hidden; }
  .dot {
    width: 28px; height: 28px; border-radius: 50%;
    background: #7c3aed; position: absolute; top: -9px; left: 0;
    transition-duration: 1.5s; transition-property: left;
  }
  .track:hover .dot { left: calc(100% - 28px); }
  .ease      { transition-timing-function: ease; }
  .linear    { transition-timing-function: linear; }
  .ease-in   { transition-timing-function: ease-in; }
  .ease-out  { transition-timing-function: ease-out; }
  label { font-size: .8rem; color: #555; width: 90px; text-align: right; }
</style>
<div class="bar"><label>ease</label><div class="track"><div class="dot ease"></div></div></div>
<div class="bar"><label>linear</label><div class="track"><div class="dot linear"></div></div></div>
<div class="bar"><label>ease-in</label><div class="track"><div class="dot ease-in"></div></div></div>
<div class="bar"><label>ease-out</label><div class="track"><div class="dot ease-out"></div></div></div>
<p style="font-size:.75rem;color:#888;margin-top:4px">Hover a track to animate</p>
{{< /demo >}}

## @keyframes animations

Name a sequence of states, then attach it with the `animation` shorthand.

```css
@keyframes name {
  from { /* start */ }
  to   { /* end */   }
  /* or use 0%, 50%, 100% for multi-step */
}

.element {
  animation: name duration timing iteration-count;
}
```

### Fade + slide in

{{< demo height="120" >}}
<style>
  @keyframes fadeSlide {
    from { opacity: 0; transform: translateY(16px); }
    to   { opacity: 1; transform: translateY(0); }
  }
  .card {
    background: #ede9fe;
    border-left: 4px solid #7c3aed;
    padding: 14px 18px;
    border-radius: 6px;
    color: #3b0764;
    font-weight: 600;
    animation: fadeSlide 0.7s ease both;
  }
</style>
<div class="card">This card fades and slides in on load.</div>
{{< /demo >}}

### Spin

{{< demo height="120" >}}
<style>
  @keyframes spin {
    to { transform: rotate(360deg); }
  }
  .spinner {
    width: 40px; height: 40px;
    border: 4px solid #ede9fe;
    border-top-color: #7c3aed;
    border-radius: 50%;
    animation: spin 0.8s linear infinite;
    margin: 16px auto;
  }
</style>
<div class="spinner"></div>
{{< /demo >}}

### Pulse

{{< demo height="120" >}}
<style>
  @keyframes pulse {
    0%, 100% { transform: scale(1);    opacity: 1; }
    50%       { transform: scale(1.12); opacity: 0.7; }
  }
  .badge {
    display: inline-block;
    background: #7c3aed;
    color: #fff;
    padding: 10px 24px;
    border-radius: 99px;
    font-weight: bold;
    animation: pulse 1.4s ease-in-out infinite;
    margin: 16px;
  }
</style>
<div class="badge">Live</div>
{{< /demo >}}

## animation properties

| Property | What it does |
|---|---|
| `animation-name` | Which `@keyframes` to use |
| `animation-duration` | How long one cycle takes |
| `animation-timing-function` | Pace within each cycle |
| `animation-delay` | Wait before starting |
| `animation-iteration-count` | `1`, `3`, `infinite` |
| `animation-direction` | `normal`, `reverse`, `alternate` |
| `animation-fill-mode` | `forwards` keeps the end state; `both` applies start state during delay |

## Respecting user preferences

Wrap motion in `prefers-reduced-motion` so users who opt out get a static version:

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```
