describe User do
  describe "#authenticate" do
    it "returns the user if password matches" do
      user = User.new("raf","password")

      expect(user.authenticate("password")).to eq(user)
    end
    it "returns nil if password does not match" do
      user = User.new("raf","password")
      expect(user.authenticate("xpassword")).to be_nil
    end
  end
end
