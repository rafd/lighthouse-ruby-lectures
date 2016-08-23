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
