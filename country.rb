require 'pg'

class Country
  attr_accessor :name, :population, :capital, :area
  attr_reader :id

  def initialize(hash)
    @id = hash["id"].to_i if hash["id"]
    @name = hash["name"]
    @population = hash["population"].to_i
    @capital = hash["capital"]
    @area = hash["area"].to_i
  end

  def save
    if id
      sql = 'UPDATE countries SET name=$1, population=$2, capital=$3, area=$4 WHERE id=$5;'
      self.class.connection.exec_params(sql, [self.name, self.population, self.capital, self.area, @id])
    else
      sql = 'INSERT INTO countries (name, population, capital, area) VALUES ($1, $2, $3, $4) RETURNING id'
      result = self.class.connection.exec_params(sql, [self.name, self.population, self.capital, self.area])
      @id = result[0]["id"].to_i
    end
  end

  def self.connection
    PG.connect(
      host: 'localhost',
      dbname: 'w3d2lecture'
    )
  end

  def self.all
    self.connection.exec('SELECT * FROM countries;') do |results|
      results.map do |hash|
        Country.new(hash)
      end
    end
  end

  def self.find(id)
    results = conn.exec_params('SELECT * from countries WHERE id=$1',[id])
    if results[0]
      Country.new(results[0])
    end
  end

  # can add other class methods, ex. where({:name => "Canada"})
  # can add string to symbol conversion for keys

end

