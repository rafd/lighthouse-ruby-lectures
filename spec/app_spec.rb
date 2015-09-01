require_relative "spec_helper.rb"
require_relative '../lib/app.rb'

describe App do
  describe "#register" do
    it "returns a user object when given username, password" do
      new_user = App.register("raf","password")

      expect(new_user).to be_a(User)
      expect(new_user.name).to eq("raf")
    end
    it "returns nil when user already exists" do
      new_user = App.register("raf","password")

      expect(new_user).to be_nil
    end
  end

  describe "#login" do
    it "when name and password match, returns user" do
      user = App.login("raf","password")

      expect(user).to be_a(User)
      expect(user.name).to eq("raf")
    end
    it "when user with name does not exist, returns nil" do
      user = App.login("abc","abc")

      expect(user).to be_nil
    end
    it "when name and password do not match, returns nil" do
      user = App.login("raf","abc")

      expect(user).to be_nil
    end
  end
end
