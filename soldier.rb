# re: stubs/mocks

class Soldier
  attr_reader :health # this creates a health method

  def initialize()
    @health = 100
  end

  def can_attack?
    # @health accesses the instance variable directly
    @health > 10  # this can't be stubbed out
    # health calls the instance method created by the attr_reader
    health > 10  # this can be stubbed out
  end

  def attacked()
    @health -= 1
  end
end

describe Soldier do
  describe "#can_attack" do
    it "can attack if health > 10" do
      soldier = Soldier.new()

      # could do this, but annoying:
      # soldier.attacked()
      # soldier.attacked()
      # soldier.attacked()
      # soldier.attacked()

      # stubbing overwrites the attr_reader method:
      # from:
      # def health
      #   @health
      # end
      # to:
      # def health
      #   5
      # end
      soldier.stub(:health).and_return 5

      expects(soldier.can_attack?).to be(false)
    end
  end
end
