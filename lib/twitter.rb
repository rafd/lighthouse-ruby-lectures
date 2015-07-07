require_relative 'user.rb'

class Twitter

  def self.register(name, password)
    if User.find(name)
      return nil
    else
      return User.new(name, password)
    end
  end

  def self.login(name, password)
    u = User.find(name)
    if u.password == password
      return u
    else
      return nil
    end
  end
end
