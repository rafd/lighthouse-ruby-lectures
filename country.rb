class Country

  def initialize(hash)
    @id = hash["id"].to_i
    @name = hash["name"]
    @population = hash["population"].to_i
    @capital = hash["capital"]
    @area = hash["area"].to_i
  end


  def save
    # persist to db (insert or update)

  end


  def self.all
    # query db for all 'countries' and return array of country objects

    conn = PG.connect(
      host: 'localhost',
      dbname: 'w3d2lecture'
    )

    conn.exec('SELECT * FROM countries;') do |results|
      results.map do |hash|
        Country.new(hash)
      end
    end

  end

end




# c = Country.new(...)
# c.name = "Foo"
# c.save
# c.name = "Bar"
# c.save
# Country.all  # [ ... ]
