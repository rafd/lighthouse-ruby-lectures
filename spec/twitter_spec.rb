require_relative 'spec_helper'
require_relative '../lib/twitter.rb'
require_relative '../lib/user.rb'

# twitter.register(user, password)
# twitter.login(user, password)

RSpec.describe Twitter, "#register" do
  it "returns a user object" do
    new_user = Twitter.register("raf","password")
    expect(new_user).to be_a(User)
    expect(new_user.name).to eq("raf")
  end

  # don't allow register of existing user
end

RSpec.describe Twitter, "#login" do
  context "given a registered user" do
    it "returns the user if password is correct" do
      user = Twitter.register("raf", "password")
      logged_in_user = Twitter.login("raf","password")
      expect(logged_in_user).to be_a(User)
      expect(logged_in_user).to be(user)
    end
    it "returns nil if password is incorrect" do
      user = Twitter.register("raf", "password")
      logged_in_user = Twitter.login("raf","xxx")
      expect(logged_in_user).to be(nil)
    end
  end
end
