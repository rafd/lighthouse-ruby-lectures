require_relative 'user.rb'

class Twitter

  @@users = {}

  def self.register(name, password)
    u = User.new(name, password)
    @@users[name] = u
    return u
  end

  def self.login(name, password)
    u = @@users[name]
    if u.password == password
      u
    else
      nil
    end
  end
end
