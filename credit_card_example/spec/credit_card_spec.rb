require_relative "../lib/credit_card"

describe "CreditCard" do
  describe "new" do
    it "starts with a balance of 0, limit of 5000, credit available to be 5000" do
      credit_card = CreditCard.new(5000)

      expect(credit_card.limit).to eq(5000)
      expect(credit_card.credit_available).to eq(5000)
      expect(credit_card.balance).to eq(0)
    end
  end

  describe "purchase" do
    it "increases balance and decreases credit available by purchase amount" do
      limit = 3000
      product = double("product")
      product.should_receive(:price).at_least(1).times.and_return(100)

      credit_card = CreditCard.new(limit)
      result = credit_card.purchase(product)

      expect(result).to be true
      expect(credit_card.balance).to eq(product.price)
      expect(credit_card.credit_available).to eq(limit - product.price)
    end

    it "does not allow purchases that would go over the limit" do
      product = double("product")
      product.should_receive(:price).at_least(1).times.and_return(100)
      credit_card = CreditCard.new(5000)
      balance = 4999
      credit_card.should_receive(:balance).at_least(1).times.and_return(balance)
      result = credit_card.purchase(product)

      expect(result).to be_nil
      expect(credit_card.balance).to eq(balance)
    end

    it "does not allow purchases of negative amount" do
      product = double("product")
      product.should_receive(:price).at_least(1).times.and_return(-1)
      credit_card = CreditCard.new(5000)
      result = credit_card.purchase(product)

      expect(result).to be_nil
      expect(credit_card.balance).to eq(0)
    end
  end

  describe "pay" do
    it "decrease balance by pay amount" do
      credit_card = CreditCard.new(5000)
      credit_card.pay(200)

      expect(credit_card.balance).to eq(-200)
    end
  end
end
