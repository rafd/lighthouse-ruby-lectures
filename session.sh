createdb w3d2lecture
psql w3d2lecture

psql w3d2lecture < schema.sql
psql w3d2lecture < seed.sql

irb
> load 'rawpg.sh'

> load 'country.rb'
> Country.all
> c = Country.new({"name"=>"Newland"})
> c.save
> c.name = "Oldland"
> c.save

