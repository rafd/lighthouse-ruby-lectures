require_relative "db"
require_relative "lib/country"
require_relative "lib/city"

canada = Country.create({name: "Canada", population: 123125, area: 123124124})
toronto = City.create({name: "Toronto"})
canada.cities << toronto # immediately persists
vancouver = City.create({name: "Vancouver"})
canada.cities << vancouver
ottawa = City.create({name: "Ottawa"})
canada.cities << ottawa
canada.capital = ottawa # does not immediately persist, needs to be saved
canada.save

usa = Country.create({name: "USA", population: 123125, area: 123124124})

