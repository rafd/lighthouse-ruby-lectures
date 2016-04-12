require_relative "country"
require "pry"

binding.pry

c = Country.new("Fakeland",1200,"Fakeland City",125126)

p c.name

c.save

c.name = "Superland"

c.save


countries = Country.all

p countries

p countries[0]


country = Country.find(1)
