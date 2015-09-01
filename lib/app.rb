require_relative "user.rb"

class App
  @users = {}

  def self.register(name,password)
    if @users[name]
      return nil
    else
      u = User.new(name,password)
      @users[name] = u
      return u
    end
  end

  def self.login(name,password)
    if user = @users[name]
      if user.verify_password(password)
        return user
      end
    end
  end
end
