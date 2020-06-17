require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.create(:like)
  end
  it "has a valid factory" do
    puts "This @like's post is #{@like.post.inspect}"
    puts "This @like's owner is #{@like.owner.inspect}"
    puts "This @like is #{@like.inspect}"
    expect(@like).to be_valid
  end
  it "is destroyed when a post is destroyed" do
    @like.post.destroy
    expect(Like.find_by(id: 1)).to be_nil
  end
  it "is destroyed when a owner is destroyed" do
    @like.owner.destroy
    expect(Like.find_by(id: 1)).to be_nil
  end
end
