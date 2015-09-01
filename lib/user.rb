class User
  attr_reader :name

  def initialize(name, password)
    @name = name
    @password = password
  end

  def verify_password(password)
    @password == password
  end

end
