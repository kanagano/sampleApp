require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "has different email addresses" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    puts "user1 is #{user1.inspect}"
    puts "user2 is #{user2.inspect}"
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")  
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "hoge@hoge.com")
    user = FactoryBot.build(:user, email: "hoge@hoge.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end 
end
