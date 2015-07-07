require_relative 'spec_helper'
require_relative '../lib/user.rb'

describe User do
  describe "#new" do
    it "returns a user with a name" do
      user = User.new("raf","password")
      expect(user).to be_a(User)
      expect(user.name).to eq("raf")
    end
  end

  describe "#verify_password" do
    it "returns true for matching password" do
      user = User.new("raf","password")
      expect(user.verify_password("password")).to be_truthy
    end

    it "returns false for wrong password" do
      user = User.new("raf","password")
      expect(user).to be_a(User)
      expect(user.verify_password("wrong")).to be_falsey
    end
  end
end
