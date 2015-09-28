var GuessingGame = {
  start: function() {
    var number = prompt("Please enter a number:");
    console.log(number);
    GuessingGame.checkGuess(number);
  },
  generateRand: function() {
    return Math.floor(Math.random() * 10);
  },
  checkGuess: function(guess) {
    if (guess == GuessingGame.generateRand()) {
      console.log("Yay!");
      alert("You were correct!");
    } else {
      console.log("Boo");
      alert("WRONG AGAIN");
    }
  }
};

GuessingGame.start();
