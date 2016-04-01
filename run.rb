require "pry"
require_relative 'bank_account'

# ask BankAccount class to create an instace of BankAccount
some_account = BankAccount.new(5000,50)

p some_account.balance

some_account.deposit(123)
p some_account.balance

some_account.withdraw(100)
p some_account.balance


t = TFSA.new(5000)


bob = Membership.new("Bob","1234")

bob.changePIN("1263")

bob.pin = "1234"



binding.pry
