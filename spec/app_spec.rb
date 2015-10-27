require_relative "../lib/app"
require_relative "../lib/user"

describe App do
  describe "#register" do
    it "returns a user when given username, password" do
      new_user = App.register("bob","password")

      expect(new_user).to be_a(User)
    end
    it "returns nil when user with name already exists" do
      new_user = App.register("bob","xxx")

      expect(new_user).to be_nil
    end
  end
  describe "#login" do
    it "when name and password match, return user" do
      user = App.login("bob","password")

      expect(user).to be_a(User)
      expect(user.name).to eq("bob")
    end
    it "when name and password don't match, return nil" do
      user = App.login("bob", "xxx")

      expect(user).to be_nil
    end
    it "when user with name does not exist, return nil" do
      user = App.login("monkey","xxx")

      expect(user).to be_nil
    end
  end
end
