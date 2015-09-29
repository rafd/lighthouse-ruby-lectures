require_relative "../lib/app"

describe App do
  describe "#register" do
    it "returns a user object when given username, password" do
      new_user = App.register("raf","password")
      expect(new_user.name).to eq("raf")
    end
    it "returns nil when user with name already exists" do
      new_user = App.register("raf","password1")

      expect(new_user).to be_nil
    end
  end
  describe "#login" do
    it "when name and password match, return user" do
      user = App.login("raf","password")

      expect(user.name).to eq("raf")
    end
    it "when name and password don't match, return nil" do
      user = App.login("raf","xpassword")

      expect(user).to be_nil
    end
    it "when user with name does not exist, return nil" do
      user = App.login("xraf","xpassword")

      expect(user).to be_nil
    end
  end
end
