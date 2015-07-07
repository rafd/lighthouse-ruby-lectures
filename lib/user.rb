class User
  @@users = {}

  attr_accessor :name, :password

  def initialize(name, password)
    @name = name
    @password = password

    @@users[name] = self

    return self
  end

  def self.find(name)
    return @@users[name]
  end
end
