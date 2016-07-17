require_relative "../lib/product"

describe "Product" do
  describe "new" do
    it "can be initialized with a price" do
      product = Product.new(1000)

      expect(product.price).to eq(1000)
    end
  end
end
