require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.create(:favorite)
  end
  it "has a valid factory" do
    puts "This @favorite's user is #{@favorite.user.inspect}"
    puts "This @favorite's museum is #{@favorite.museum.inspect}"
    puts "This @favorite is #{@favorite.inspect}"
    expect(@favorite).to be_valid
  end
  it "works with a through association when user to museums" do
    expect(@favorite.user.museums).to include(@favorite.museum)
  end
  it "works with a through association when museum to users" do
    expect(@favorite.museum.users).to include(@favorite.user)
  end
  describe "dependent: :destroy" do
    it "is destroyed when a user is destroyed" do
      @favorite.user.destroy
      expect(Favorite.find_by(id: 1)).to be_nil
    end
    it "is destroyed when a museum is destroyed" do
      @favorite.museum.destroy
      expect(Favorite.find_by(id: 1)).to be_nil
    end
  end
end
