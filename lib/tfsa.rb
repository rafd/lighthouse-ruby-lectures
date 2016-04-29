require_relative "generic_account"

class TFSA < GenericAccount
  LIMIT = 5000

  def deposit(amount)
    if can_deposit?(amount)
      super(amount)
    else
      puts "cannot deposit because over limit"
    end
  end

  private

  def can_deposit?(amount)
    (@balance + amount) < LIMIT
  end

end
