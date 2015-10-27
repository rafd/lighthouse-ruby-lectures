class User
  attr_reader :name

  def initialize(name,password)
    @name = name
    @password = encrypt(password)
  end

  def authenticate(password)
    @password == encrypt(password)
  end

  private

  def encrypt(password)
    # really shity encrypt
    password.reverse
  end
end

