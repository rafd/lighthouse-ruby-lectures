var GuessingGame = {
  number: null,
  guess: null,
  start: function() {
    this.generateRand();
    this.guess = parseInt(prompt("Please enter a number:"),10);
    console.log(this.guess);
    this.checkGuess();
  },
  generateRand: function() {
    this.number = Math.floor(Math.random() * 10);
    console.log(this.number);
  },
  checkGuess: function() {
    if (this.guess === this.number) {
      console.log("Yay!");
      alert("You were correct!");
    } else {
      console.log("Boo!");
      alert("WRONG AGAIN");
    }
  }
};

GuessingGame.start();
