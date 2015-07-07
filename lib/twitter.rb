require_relative 'user.rb'

class Twitter

  @@users = {}

  def self.register(name, password)
    if @@users[name]
      return nil
    else
      u = User.new(name, password)
      @@users[name] = u
      return u
    end
  end

  def self.login(name, password)
    u = @@users[name]
    if u.password == password
      return u
    else
      return nil
    end
  end
end
