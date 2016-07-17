class GenericAccount
  INTEREST_RATE = 0

  attr_reader :balance

  def initialize(start_balance)
    @balance = start_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def credit_interest
    # instead of the following:
    # @balance += (@balance * @interest_rate)
    # we write:
    deposit(@balance * INTEREST_RATE)
    # so we don't duplicate the logic of what a "deposit" means
  end
end
