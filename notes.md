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

# jQuery

## selecting elements:

  `$("some #css .selector")`

## creating elements:

   `$("<p>")`

## "storing" elements:

  use convention of $name for variables that will be elements

  `$foo = $("<p>")`

## handling events:

  `$el.on("click", function() { ... })`

  `$el.on("focus", function() { ... })`

  `$el.on("blur" , function() { ... })`

## styling elements

### directly:

  `$el.css("color","red")`

  `$el.css({color: "red", background: "green"})`

  http://api.jquery.com/css/

### via css defined elsewhere (preferred):

  `$el.addClass("active")`

  `$el.removeClass("active")`

## chaining:

  `$("<p>").text(someVar).css("color","green").addClass("blah")`

  Don't do: `$("<p style='color:green'>"+someVar+"</p>")`

## animations:

  `$el.animate({ width: "50%"}, 1000)`

## queues:

  all animation effects create 'queues' (ex. `animate()`, `slideUp()`, `fadeOut()`, `delay()` )

  can chain them together

  `$el.slideUp(500).delay(500).slideDown(500)`

  most functions don't know about animations (ex. addClass), and must be wrapped in a `queue()`

  (if you use `.queue()` you must remember to `dequeue()` inside of it )

  ```
  $el.animate()
    .delay(500)
    .queue(function() {
      $el.addClass("open");
      $(this).dequeue();
    })
    .delay(500)
    .queue(function() {
      $el.addClass("close");
      $(this).dequeue();
    })
  ```

  https://api.jquery.com/animate/

  https://api.jquery.com/delay/
