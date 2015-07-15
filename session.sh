createdb w3d3
bundle install

ruby setup.rb
ruby seed.rb
ruby app.rb

> Country.all
> Country.first.name
> Country.first.cities
> Country.first.cities.first.name
> Country.first.capital
> canada = Country.find_by_name("Canada")
> calgary = City.create({name: "Calgary"})
> canada.cities << calgary

