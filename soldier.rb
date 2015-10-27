# re: stubs/mocks

class Soldier
  attr_reader :health

  def inititialize(health)
    @health = health
  end

  def can_attack?
    # must use health and not @health, or else stub below will be useless
    health > 10
  end
end

describe Soldier do
  describe "#can_attack" do
    it "can attack if health > 10" do
      soldier.stub(:health).and_return 5
      expects(soldier.can_attack?).to be(false)
    end
  end
end
