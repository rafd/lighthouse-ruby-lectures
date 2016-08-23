require "pry"

class BankAccount

  class ZeroBalanceException < StandardError
  end

  def initialize(interest_rate, balance)
    @interest_rate = interest_rate
    @balance = balance
  end

  def print_balance
    puts @balance
  end

  def withdraw(amount)
    if @balance == 0
      raise ZeroBalanceException
    end
    @balance -= amount
  end
end

ba = BankAccount.new(0.06,5000)


class ChequingAccount < BankAccount
  def initialize(balance)
    #@balance = balance
    #@interest_rate = 0.03

    super(0.03, balance)
  end
end

ca = ChequingAccount.new(5000)

class SavingsAccount < BankAccount

  MINIMUM_BALANCE = 4000

  def initialize(balance)
    super(0.06, balance)
  end

  def also_print_balance
    print_balance
  end

  def withdraw(amount)
    if (@balance - amount) < MINIMUM_BALANCE
      puts "cannot withdraw"
    else
      # @balance -= amount
      super
    end
  end
end

sa = SavingsAccount.new(5000)


# this could be anywhere:

a = BankAccount.new(0,0)
begin
  a.withdraw(1)
rescue BankAccount::ZeroBalanceException
  puts "Zero Balance Exception"
end

binding.pry


