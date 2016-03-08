require_relative "user"

class Event
  attr_reader :name, :limit

  def initialize(name, limit)
    @name = name
    @limit = limit
    @users = {}
  end

  def register(user)
    return nil if full?
    unless @users[user.email]
      @users[user.email] = user
    end
  end

  def registered?(email)
    !@users[email].nil?
  end

  def full?
    count == @limit
  end

  def count
    @users.count
  end

end

# {"bob@gmail.com" => <User:3212351235>,
#  "mike@aol.com" => <User:25123512> }
