intro to programming and ruby

  repl
    stands for: read eval print loop
    useful tool for playing around
    irb (or pry)

    note: every statement (line) of code in ruby "returns" something

  variables
    store data / "state"
    foo = 5

  constants
    like variables, but can't change
    FOO = 5

  objects
    have different types
      | Example       | Data Type           |   |
      | ------------- |:-------------:| -----:|
      | `"something"` | string | text (can manipulate characters, add, shorten) |
      | `:something`  | symbol | re-usable text label (but w/o text manipulation) |
      | `12` | integer      | numbers without a decimal |
      | `12.0` | float | decimals|
      | `true` or `false` | boolean | true or false values |
      | `nil` | nothing | indicates a variable has no value |

    have methods
      "Hello".reverse

      you should look up the various methods of the types above

      http://ruby-doc.org/core-2.2.3/String.html
      http://ruby-doc.org/core-2.2.3/Integer.html

    (we'll learn about making our own objects next week)

  methods (aka functions)
    reusable chunks of code
    can take in 'arguments'
    function will return value of last statement in the function
      you don't need to use the returned value of a function (but often you want to!)
      you can return before the last line (those lines won't be run)

    def square(x)
      return x*x
    end

    square(5)  # 25

  conditionals
    b = gets.chomp.to_i

    if b > 10
      # do something
    elseif b > 0
      # do something
    else
      # do something
    end

  loops
    10.times do
      # ...
    end

    foo = 10
    while foo > 0
      puts foo
      foo = foo - 1
    end

    [9,10,10].each do |x|
      puts x
    end

    [9,10,11].each_with_index do |x, ind|
      puts ind, x
    end

    (we'll learn more about lists tomorrow)
    http://ruby-doc.org/core-2.2.3/Array.html

  stdio
    gets.chomp
    puts

    gets always returns a string!

debugging
  errors are your friend

MIT crash course: http://web.mit.edu/bsw/Public/ruby.pdf
