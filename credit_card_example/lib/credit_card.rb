class CreditCard
  attr_reader :balance, :limit

  def initialize(limit)
    @limit = limit
    @balance = 0
  end

  def purchase(product)
    if product.price < 0
      return nil
    end

    if balance + product.price < @limit
      @balance += product.price
      true
    end
  end

  def credit_available
    @limit - @balance
  end

  def pay(amount)
    @balance -= amount
  end

end
