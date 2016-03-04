class Car

  @@all_cars = []

  # PUBLIC INSTANCE METHODS

  attr_reader :speed, :gas, :location

  def initialize(color)
    p "initialize", self
    @color = color
    @speed = 0
    @gas = 100
    @location = 0

    @@all_cars << self
  end

  def accelerate
    @speed += 10
  end

  def decelerate
    @speed -= 10
  end

  def move
    if @gas > 0
      @location += @speed
      @gas -= 1
    else
      gas_alarm
    end
  end

  # PRIVATE INSTANCE METHODS

  private

  def gas_alarm
    puts "you're out of gas!"
  end

  # CLASS METHODS

  p "class", self

  def self.all
    @@all_cars
  end

  def self.delete(car)
    @@all_cars = @@all_cars.reject {|c| c == car }
  end

end

car = Car.new(:green)
car.accelerate
car.accelerate
101.times do
  car.move
  p car.gas
  p car.location
end

# cannot call gas_alarm b/c it is private
# car.gas_alarm

if false
  car2 = Car.new(:blue)
  car2.accelerate
  car2.decelerate
  p car2.speed

  p Car.all
  p Car.all[0].speed
end




