require 'pry'
require 'byebug'

def square(x)
  puts "inside square"
  return x * x
end

binding.pry # pry will pause the program here

# using 'step', pry will go inside functions, in this case, the square function ("we must go deeper!")
# using 'next', pry will stay on this 'level'
n = square(25)

p n

