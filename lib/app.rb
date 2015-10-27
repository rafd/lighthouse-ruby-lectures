require_relative "user"

class App
  @@users = {}

  def self.register(name,password)
    if @@users[name]
      nil
    else
      @@users[name] = User.new(name,password)
    end
  end

  def self.login(name,password)
    if u = @@users[name] and u.authenticate(password)
      u
    end
  end
end
