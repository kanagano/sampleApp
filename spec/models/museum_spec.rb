require 'rails_helper'

RSpec.describe Museum, type: :model do
  before do
    @museum = FactoryBot.create(:museum)
  end
  it "has a valid factory" do
    expect(@museum).to be_valid
  end
end
