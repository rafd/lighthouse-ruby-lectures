require_relative 'spec_helper'
require_relative '../lib/twitter.rb'
require_relative '../lib/user.rb'

describe Twitter do
  describe "#register" do
    it "returns a user object" do
      new_user = Twitter.register("raf","password")
      expect(new_user).to be_a(User)
      expect(new_user.name).to eq("raf")
    end

    it "should return nil if user is already registered" do
      user_1 = Twitter.register("raf","password")
      user_2 = Twitter.register("raf","password")

      expect(user_2).to be(nil)
    end
  end

  describe "#login" do
    it "returns the user if password is correct" do
      user = Twitter.register("raf2", "password")
      logged_in_user = Twitter.login("raf2","password")
      expect(logged_in_user).to be_a(User)
      expect(logged_in_user).to be(user)
    end
    it "returns nil if password is incorrect" do
      user = Twitter.register("raf2", "password")
      logged_in_user = Twitter.login("raf2","xxx")
      expect(logged_in_user).to be(nil)
    end
  end

end


