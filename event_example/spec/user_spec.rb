require_relative "../lib/user"

describe "User" do
  describe "initialize" do
    it "returns a user with an email" do
      user = User.new("a@b.com")

      expect(user.email).to eq("a@b.com")
    end
  end
end
