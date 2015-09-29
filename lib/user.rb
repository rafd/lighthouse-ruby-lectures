def shitty_encrypt(password)
  password.reverse.chars.map do |c|
    c+c
  end.join("")
end

class User
  attr_reader :name

  def initialize(name,password)
    @name = name
    @password = shitty_encrypt(password)
  end

  def authenticate(password)
    if @password == shitty_encrypt(password)
      return self
    end
  end
end
