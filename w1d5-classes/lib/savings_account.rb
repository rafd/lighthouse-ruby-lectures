require_relative "generic_account"

class SavingsAccount < GenericAccount
  INTEREST_RATE = 0.05

  def withdraw(amount)
    if sufficient_funds?(amount)
      super(amount)
    else
      puts "insufficient funds for withdrawal"
    end
  end

  private

  def sufficient_funds?(amount)
    @balance - amount > 0
  end

end

