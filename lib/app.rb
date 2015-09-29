require_relative "user"

class App
  @users = {}

  def self.register(name,password)
    if @users[name]
      nil
    else
      @users[name] = User.new(name,password)
    end
  end

  def self.login(name,password)
    if @users[name]
      @users[name].authenticate(password)
    end
  end
end
