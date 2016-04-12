require "pg"

conn = PG.connect(
  host: 'localhost',
  dbname: 'w3d2lecture'
)

conn.exec('SELECT * FROM countries;') do |results|
  results.each do |country|
    p country
  end
end

