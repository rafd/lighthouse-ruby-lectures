require "pry"
require "pg"

conn = PG.connect(
  host: 'localhost',
  dbname: 'w3d2lecture'
)


# SELECT ALL

conn.exec('SELECT * FROM countries;') do |results|
  results.each do |country|
    p country
  end
end


# INSERT

countries = [{name: "Spain", :population 5},
             {name: "France" :population 6},
             {name: "'); DROP TABLE countries; --", :population 0}]

countries.each do |country|
  # UNSAFE, NEVER EVER STRING INTERPOLATE (OR CONCAT VALUES) A DATABASE QUERY STRING
  r = conn.exec("INSERT INTO countries (name) VALUES ('#{country[:name]}') RETURNING id;")
  # ends up as: "INSERT INTO countries (name) VALUES (''); DROP TABLE countries; --) RETURNING id;"

  # THIS IS OKAY, exec_params 'escapes' data so that it is not interpreted as a command
  r = conn.exec_params("INSERT INTO countries (name, population) VALUES ($1, $2)') RETURNING id;",
                       [country[:name], country[:population]])
end

binding.pry
