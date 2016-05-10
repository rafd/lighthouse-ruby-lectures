require "pg"

class Country
  attr_accessor :name, :population, :capital, :area
  attr_reader :id

  @@conn = PG.connect(
    host: 'localhost',
    dbname: 'w3d2lecture'
  )

  def initialize(name,population,capital,area,id=nil)
    @name = name
    @population = population
    @capital = capital
    @area = area
    @id = id
  end

  def self.find(id)
    results = @@conn.exec_params('SELECT * from countries WHERE id=$1',[id])
    if results[0]
      Country.new_from_row(results[0])
    end
  end

  def self.all
    @@conn.exec('SELECT * FROM countries;') do |results|
      results.map do |c|
        Country.new_from_row(c)
      end
    end
  end

  def saved?
    self.id ? true : false
  end

  def save
    if saved?
      update
    else
      insert
    end
  end

  private

  def insert
    # DO NOT DIRECTLY INTERPOLATE SQL QUERIES
    # THIS IS A MAJOR SECURITY HOLE
    # YOU MUSE USE exec_params

    @@conn.exec_params("INSERT INTO countries (name, population, capital, area) VALUES ($1, $2, $3, $4) RETURNING id", [name, population, capital, area]) do |results|
      @id = results[0]["id"]
    end
  end

  def update
    @@conn.exec_params("UPDATE countries SET name=$1, population=$2, capital=$3, area=$4 WHERE id=$5;", [name, population, capital, area, id])
  end

  def self.new_from_row(c)
    Country.new(c["name"],c["population"].to_i,c["capital"],c["area"].to_i,c["id"])
  end
end
