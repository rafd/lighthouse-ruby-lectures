require_relative "../lib/event"

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

      # using a stub!
      allow(event).to receive(:count).and_return(10)

      expect(event.full?).to eq(true)
    end
  end

  describe "register" do

    it "increments count when user registers" do
      event = Event.new("Name", 1)
      event.register(double("user", :email => "foo"))
      expect(event.count).to be(1)
    end

    it "does not increment count when same user attempts to register again" do
      event = Event.new("Name", 1)
      # using a mock!
      user = double("user", :email => "foo")
      event.register(user)
      event.register(user)

      expect(event.count).to be(1)
    end

    it "does not increment count when already full" do
      event = Event.new("Name",100)

      # using a stub!
      allow(event).to receive(:full?).and_return(true)

      # using a mock!
      event.register(double("user", :email => "foo"))

      expect(event.count).to be(0)
    end
  end

  describe "registered?" do
    it "returns false if user is not registered" do
      event = Event.new("Name",10)

      expect(event.registered?("bob@bob.com")).to be(false)
    end

    it "returns true if user is registered" do
      event = Event.new("Name",10)
      event.register(double("user", :email => "bob@bob.com"))

      expect(event.registered?("bob@bob.com")).to be(true)
    end
  end

end
