require_relative "../lib/event"
require_relative "../lib/user"

describe "Event" do
  describe "initialize" do
    it "returns event with a name and a limit" do
      event = Event.new("Name",10)

      expect(event.name).to eq("Name")
      expect(event.limit).to eq(10)
    end
  end

  describe "full?" do
    it "returns false if below limit" do
      event = Event.new("Name", 10)

      expect(event.full?).to eq(false)
    end
    it "returns true if at the limit" do
      event = Event.new("Name", 10)

      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)
      event.register(User.new)

      expect(event.full?).to eq(true)
    end
  end

  describe "register" do

    it "increments count when user registers" do
      event = Event.new("Name", 1)
      event.register(User.new("foo@bar.com"))
      expect(event.count).to be(1)
    end

    it "does not increment count when same user attempts to register again" do
      event = Event.new("Name", 1)

      user = User.new("foo")
      event.register(user)
      event.register(user)

      expect(event.count).to be(1)
    end

    it "does not increment count when already full" do
      event = Event.new("Name", 0)

      event.register(User.new)

      expect(event.count).to be(0)
    end
  end

  describe "registered?" do
    it "returns false if user is not registered" do
      event = Event.new("Name", 10)

      expect(event.registered?("bob@bob.com")).to be(false)
    end

    it "returns true if user is registered" do
      event = Event.new("Name",10)
      event.register(User.new("bob@bob.com"))

      expect(event.registered?("bob@bob.com")).to be(true)
    end
  end

end
