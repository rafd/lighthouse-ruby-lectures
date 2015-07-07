require_relative 'spec_helper'
require_relative '../lib/user.rb'

RSpec.describe User, "#new" do
  it "returns a user with a name" do
    user = User.new("raf","password")
    expect(user).to be_a(User)
    expect(user.name).to eq("raf")
  end
  it "returns user with a password" do
    user = User.new("raf","password")
    expect(user).to be_a(User)
    expect(user.password).to eq("password")
  end
end
