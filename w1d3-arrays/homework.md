# Homework

## Q1 What does string interpolation mean? Provide an example.

Allows Ruby code to appear within a string.

  name = "John"
  name =  "My name is #{name}

## Q2 What is the difference between single quoted strings and double quoted strings in Ruby?

Single quotes allow two escape sequences - single quote and single backslash. Double quotes allow many escape sequences as well as interpolations.

General thumb of rule, use single quotes unless you need interpolation.

## Q3 Why do we call chomp on gets? What does it do?

Gets rid of newline characters in the end - \n, \r, \r\n. We also saw that if we call "hello\n\r".chomp, we get "hello\n"

# Q4 What is a R-E-P-L?

Read-evaluate-print-loop.

# Q5 What's the difference between the following 2 lines of Ruby code?

  puts "it's not true!" if !true
  puts "it's not true!" unless true

Both same functionality. Use one which is more readable.

# Q6 Is the following ruby code valid? If so, describe what it's doing. (Hint: Try it out in IRB)

  pooped = true
  underwear = if pooped
                :soiled
              else
                :safe
              end
  puts underwear

Doing the same stuff as below.

  pooped = ""
  underwear = pooped ? :soiled : :safe
  puts underwear
