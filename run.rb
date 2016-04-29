require "pry"
require_relative 'lib/savings_account'
require_relative 'lib/chequing_account'
require_relative 'lib/tfsa'

sa1 = SavingsAccount.new(5000)
p sa1.balance
sa1.deposit(123)
p sa1.balance

sa1.withdraw(100)
p sa1.balance

p SavingsAccount::INTEREST_RATE

binding.pry
