class City
  attr_reader :name, :population

  def initialize(name, population)
    @name = name
    @population = population
  end
end

class Country

  @@countries = []

  def initialize(name)
    @name = name
    @cities = []
    @capital = nil
    @@countries << self
  end

  def self.all()
    @@countries
  end

  def display()
    "#{@name} #{@capital}"
  end

  def add_city(city)
    @cities << city
  end

  def cities()
    @cities
  end

  def assign_capital(key)
    @capital = key
  end

  def capital()
    city_with_name(@capital)
  end

  def get_city(name)
    city_with_name(name)
  end

  private

  def city_with_name(name)
    @cities.select do |city|
      city.name == name
    end
  end
end
