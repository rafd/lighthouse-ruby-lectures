# CSS

## selectors:

  `element`

  `#id`

  `.class`


  ` `  (ancestry) (blank space)

  `>` (direct child)

  `+` (adjacent)

  `~` (precedence)


  `foo[attr=value]`  (also: `~=`, `|=`, `^=`, `$=`, `*=`)


  http://www.w3schools.com/cssref/css_selectors.asp

  https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors

## pseudo classes:

   `:hover`, `:active`, `:focus`

   http://www.w3schools.com/css/css_pseudo_classes.asp

## pseudo elements:

  CSS can "create" DOM elements.

  Very useful: often you need extra elements to achieve style goals, but pseudo elements allow you to avoid polluting your HTML with elements just for styling.

  `::before`, `::after`

  https://css-tricks.com/pseudo-element-roundup/


## priority / specificity:

  when two rules conflict, css uses a calculation to decide which one to apply

  it depends on the number of inline-styles, ids, classes, and elements in the selector

  `div a` is more selective than `a`

  `!important` also increases selectivity per property
  ex.
    ```css
    div {
      color: green !important;
    }
    ```

  https://css-tricks.com/specifics-on-css-specificity/

  https://www.smashingmagazine.com/2007/07/css-specificity-things-you-should-know/

## transitions:

  `transition: all 1s ease-in-out;`

  http://www.w3schools.com/css/css3_transitions.asp

  http://easings.net/

## transformations:

   `transform: translate(400px, 200px);`

   (can be transitioned)

   http://www.w3schools.com/css/css3_2dtransforms.asp

## flex-box:

  very powerful layout mode:

  https://css-tricks.com/snippets/css/a-guide-to-flexbox/
  http://flexboxfroggy.com/

## other CSS resources:

https://developer.mozilla.org/en-US/docs/Web/Guide/CSS

http://2zpt4dwruy922flhqyznip50.wpengine.netdna-cdn.com/wp-content/uploads/2015/10/css3-mega-cheat-sheet.jpg

http://learnlayout.com/

http://learn.shayhowe.com/html-css/
