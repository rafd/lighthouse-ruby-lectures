class User
  @@users = {}

  attr_accessor :name

  def initialize(name, password)
    @name = name
    @password = password

    @@users[name] = self

    return self
  end

  def verify_password(password)
    @password == password
  end

  def self.find(name)
    return @@users[name]
  end
end
