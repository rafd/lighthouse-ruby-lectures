module Feline
  def meow
    puts "MEOW"
  end
end

module RunningAnimal
  attr_reader :position

  def initialize
    @position = 0
  end

  def run
    @position += 5
  end
end

class Dog
  include RunningAnimal

  def run
    @position += 10
  end

  def bark
    puts "WOOF"
  end
end

class Cat
  include RunningAnimal
  include Feline

  def run
    super
    puts "but i'm tired..."
    return s
  end
end

class Lion
  include RunningAnimal
  include Feline
end


dog = Dog.new
dog.run

cat = Cat.new
cat.meow
cat.run

lion = Lion.new
lion.meow
lion.run
