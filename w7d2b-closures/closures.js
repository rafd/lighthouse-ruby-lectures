// CLOSURES
//
// closures are functions that refer to variables defined in an enclosing scope
// closures keep a reference to the variables and can keep manipulating them
//
// great resources:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures
// http://stackoverflow.com/questions/111102/how-do-javascript-closures-work
//
// closures can be used to "hide" methods or variables from other parts of the application (think "private methods" in Ruby)
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures#Emulating_private_methods_with_closures
//
// a common error is accidentally creating a closure when looping:
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures#Creating_closures_in_loops_A_common_mistake
//
// closures can also lead to memory leaks if not managed properly:
// http://point.davidglasser.net/2013/06/27/surprising-javascript-memory-leak.html
//
// a super deep dive into closures:
// https://github.com/getify/You-Dont-Know-JS/blob/master/scope%20&%20closures/README.md#you-dont-know-js-scope--closures

// say we want to create a function that keeps track of the number of times it was called
// without knowing about closures, we could write it like this:

var fooCallCount = 0;

var foo = function() {
  fooCallCount += 1;
  console.log("hello " + fooCallCount);
}

foo(); // "hello 1"
foo(); // "hello 2"


// our foo function is a closure because fooCallCount is defined outside its scope
// but this isn't very interesting... let's go deeper...

// but, wouldn't it be nice if we didn't have to have the extra variable sitting around?

// we could wrap everything we did before inside a function:

var fooFactory = function () {
  var fooCallCount = 0;

  return function() {
    fooCallCount += 1;
    console.log("hello " + fooCallCount);
  }
}

// works just like before:

var foo = fooFactory();
foo(); // "hello 1"
foo(); // "hello 2"

// but, we have created a closure
// foo remembers the value of fooCallCount, even after fooFactory has finished being invoked

// fooFactory is a function:

console.log(fooFactory); // [function]

// fooFactory returns a function:

console.log(fooFactory()); // [function]

// we can call the function that fooFactory returns by giving it a name and then invoking it:

var foo = fooFactory();
console.log( foo() ); // "hello 1"

// or, we can immediately invoke it:

console.log( ( fooFactory() )() );  // "hello 1"


// ASIDE:

// here is an anonymous function:

function() { console.log("x") };

// here we give an anonymous function a name:

var foo = function() { console.log("x") }

// here's how we call it:

foo();

// we could also call it like this:

(foo)();

// and so... we could also write:

(function() { console.log("x") })();

// the above pattern is called an IIFE (Immediately Invoked Function Expression)

// END OF ASIDE


// back to our fooFactory,
// this is where we were at:

var fooFactory = function () {
  var fooCallCount = 0;

  return function() {
    fooCallCount += 1;
    console.log("hello " + fooCallCount);
    return fooCallCount;
  }
}
var foo = fooFactory();
foo();

// we could use the IIFE pattern to get rid of fooFactory, and immediately define foo:

var foo = (function () {
  var fooCallCount = 0;

  return function() {
    fooCallCount += 1;
    console.log("hello " + fooCallCount);
    return fooCallCount;
  }
})();
foo();



