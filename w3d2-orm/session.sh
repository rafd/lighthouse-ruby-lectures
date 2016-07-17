createdb w3d2lecture
psql w3d2lecture

psql w3d2lecture < schema.sql
psql w3d2lecture < seed.sql

irb
> load 'rawpg.rb'

> load 'country.rb'
> Country.all
> c = Country.new("Newland",1000,"Capital City",1000)
> c.save
> c.name = "Oldland"
> c.save
> Country.find(1)

