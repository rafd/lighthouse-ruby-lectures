class Animal
  attr_reader :position

  def initialize
    @position = 0
  end

  def run
    @position += 5
  end
end

class Dog < Animal
  def run
    @position += 10
  end

  def bark
    puts "WOOF"
  end
end

class Cat < Animal
  def run
    super
    puts "but i'm tired..."
    return s
  end

  def meow
    puts "MEOW"
  end
end

dog = Dog.new
dog.run

cat = Cat.new
cat.meow
cat.run
