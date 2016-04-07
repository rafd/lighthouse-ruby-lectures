require "pry"

class Person
  SPEAK_LIMIT = 3
  @@people = []
  @@speak_times = 0

  def self.people
    @@people
  end

  def initialize(n)
    @name = n
    @age = 10

    @@people << self
  end

  def speak
    if @@speak_times < SPEAK_LIMIT
      puts "I HAVE SPOKEN!"
      @@speak_times += 1
    else
      puts "(I cannot speak)"
    end
  end

end

class GoodPerson < Person

  def speak
    @@speak_times += 1
    puts "speak"
  end

end

a1 = Person.new("Bob")
a2 = Person.new("Sally")
a3 = Person.new("Jill")

Person::SPEAK_LIMIT

binding.pry

