class BankAccount
  START_BALANCE = 5000

  def initialize(start_balance=START_BALANCE, interest_rate=0)
    @balance = start_balance
    @interest_rate = interest_rate
  end

  # 1 is equivalent to having 2 and 3:

  # 1
  attr_reader :balance, :interest_rate

  # 2
  def balance
    @balance
  end

  # 3
  def interest_rate
    @interest_rate
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def creditInterest()
    # instead of the following:
    # @balance += (@balance * @interest_rate)
    # we write:
    deposit(@balance * @interest_rate)
    # so we don't duplicate the logic of what a "deposit" means
  end
end

class TFSA < BankAccount
  LIMIT = 5000
  INTEREST_RATE = 0.05

  def initialize(start_balance=START_BALANCE)
    # we don't want to duplicate the code used to define instance variables in BankAccount initialize
    # so we can use super() instead:
    super(start_balance, INTEREST_RATE)
  end

  # this isn't really how a TFSA limit works
  def deposit(amount)
    if (@balance + amount) > LIMIT
      puts "You cannot deposit b/c you would be over the limit."
    else
      super(amount)
      # using super(amount) is better than:
      # @balance += amount
      # b/c it avoids duplicating the logic of what "deposit" means
    end
  end

end


class Membership

  def initialize(name,pin)
    @name = name
    @pin = pin
  end

  def changePIN(new_pin)
    @pin = new_pin
  end

  # the following 2 are equivalent:

  attr_writer :pin

  def pin= (new_pin)
    @pin = new_pin
  end

  # A is equivalent to having B and C

  # A
  attr_accessor :name

  # B
  def name
    @name
  end

  # C
  def name= (name)
    @name = name
  end


end
