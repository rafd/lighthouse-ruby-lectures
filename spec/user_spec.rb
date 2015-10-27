require_relative "../lib/user"

describe User do
  describe "#new" do
    it "returns user with name" do
      new_user = User.new("bob","password")

      expect(new_user.name).to eq("bob")
    end
    it "returns user without password" do
      new_user = User.new("bob","password")

      expect{new_user.password}.to raise_error NoMethodError
    end
  end
  describe "#authenticate" do
    it "returns true when password matches" do
      user = User.new("bob","password")
      expect(user.authenticate("password")).to be(true)
    end
    it "returns false if password does not match" do
      user = User.new("bob","password")
      expect(user.authenticate("xpassword")).to be(false)
    end
  end
end
