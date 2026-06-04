---
title: "Selectors"
description: "Which rules hit which elements"
weight: 1
iconId: "icon-target"
---

CSS selectors tell the browser *which* elements a rule applies to. Everything before the `{` is a selector.

## Type selectors

Write the tag name and it matches every element of that type.

{{< demo height="140" >}}
<style>
  p  { color: steelblue; }
  h3 { color: tomato; margin: 0 0 4px; }
</style>
<h3>This is an h3</h3>
<p>This paragraph is selected by <code>p</code>.</p>
<p>Another paragraph, also selected.</p>
{{< /demo >}}

## Class selectors

`.classname` matches elements with that class. An element can carry multiple classes.

{{< demo height="160" >}}
<style>
  .highlight { background: gold; padding: 2px 6px; border-radius: 4px; }
  .big       { font-size: 1.4rem; font-weight: bold; }
</style>
<p>Normal text, then <span class="highlight">highlighted</span> text.</p>
<p class="big">Big text via the <code>.big</code> class.</p>
<p class="big highlight">Both classes at once.</p>
{{< /demo >}}

## ID selectors

`#id` matches the single element with that ID. IDs are unique per page.

{{< demo height="110" >}}
<style>
  #special { border: 2px solid purple; padding: 8px; border-radius: 6px; }
</style>
<p>Plain paragraph.</p>
<p id="special">This paragraph has <code>id="special"</code>.</p>
{{< /demo >}}

## Descendant & child selectors

`A B` matches B anywhere inside A. `A > B` matches B that is a *direct* child of A.

{{< demo height="180" >}}
<style>
  .box span        { color: steelblue; }   /* any span inside .box */
  .box > strong    { color: tomato; }       /* only direct strong child */
</style>
<div class="box">
  <strong>Direct child strong — red</strong>
  <p>Paragraph with a <span>span inside</span> — blue</p>
  <p><em><span>Nested deeper span</span></em> — also blue</p>
</div>
{{< /demo >}}

## Attribute selectors

Square brackets match on attribute values.

{{< demo height="180" >}}
<style>
  a[href^="https"] { color: green; }      /* href starts with https */
  a[href$=".pdf"]  { color: tomato; }     /* href ends with .pdf    */
  input[type="text"] { border: 2px solid steelblue; padding: 4px; }
</style>
<a href="https://example.com">Secure link (green)</a><br>
<a href="report.pdf">PDF link (red)</a><br><br>
<input type="text" placeholder="text input">
<input type="submit" value="submit">
{{< /demo >}}

## Pseudo-classes

`:hover`, `:focus`, `:nth-child()`, `:first-child`, `:not()` match elements based on their current state.

{{< demo height="200" >}}
<style>
  li:first-child   { font-weight: bold; color: purple; }
  li:nth-child(2n) { background: var(--ds-surface); }  /* every even item */
  a:hover          { background: gold; text-decoration: none; }
  a:focus          { outline: 3px solid orange; }
</style>
<ul>
  <li>First (bold + purple)</li>
  <li>Second (grey bg)</li>
  <li>Third</li>
  <li>Fourth (grey bg)</li>
</ul>
<br>
<a href="#">Hover me</a>
{{< /demo >}}

## Pseudo-elements

`::before` and `::after` insert generated content. `::first-letter` / `::first-line` target part of text.

{{< demo height="160" >}}
<style>
  .tip::before {
    content: "💡 ";
  }
  p::first-letter {
    font-size: 2em;
    font-weight: bold;
    color: steelblue;
    float: left;
    margin-right: 4px;
    line-height: 1;
  }
</style>
<p class="tip">Pseudo-elements don't need a real HTML element.</p>
<p>Drop caps use ::first-letter to style just the opening character of a paragraph.</p>
{{< /demo >}}

## Specificity in brief

When two rules target the same element, the more *specific* selector wins:

| Selector type | Weight |
|---|---|
| Inline `style=""` | 1-0-0-0 |
| ID `#foo` | 0-1-0-0 |
| Class `.foo`, attribute, pseudo-class | 0-0-1-0 |
| Type `div`, pseudo-element | 0-0-0-1 |

A class always beats a type selector, regardless of order.
