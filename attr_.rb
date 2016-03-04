class Car

  def initialize(color)
    @color = color
    @speed = 0
  end

  # the following are equivalent:

  attr_reader :speed

  def speed
    @speed
  end

  # the following are equivalent:

  attr_writer :speed

  def speed=(x)
    @speed = x
  end

  # the following are equivalent:

  attr_accessor :speed

  def speed
    @speed
  end

  def speed=(x)
    @speed = x
  end

end

car = Car.new(:green)
p car.speed
car.speed = 50

car2 = Car.new(:blue)
p car2.speed
car2.speed = 50
