require_relative "spec_helper.rb"
require_relative "../lib/user.rb"

describe User do
  describe "#verify_password" do
    it "returns true if password matches" do
      u = User.new("r","p")
      expect(u.verify_password("p")).to be true
    end
    it "returns false if password does not match" do
      u = User.new("x","p")
      expect(u.verify_password("x")).to be false
    end
  end
end
