/*
// prompt

n = prompt("What is your name?")
console.log("Hi "+n);

// alert

alert("Yo!")
// setTimeout, setInterval

var interval = setInterval(function() {
 console.log(Math.random());
}, 500);

setTimeout(function() {
  clearInterval(interval);
}, 3000);

// looping through arrays

// for loop:

var a = [1,2,3,4];
for(var i = 0; i < a.length; i++) {
  console.log(a[i]);
}

// some environments:

[5,6,7,8].forEach(function(x) {
  console.log(x);
});

*/
// w/ http://underscorejs.org/

_.each([1,2,3,4], function(x) {
  console.log(x);
})

// also w/ underscore:

_([1,2,3,4]).each(function(x) {
  console.log(x);
});

