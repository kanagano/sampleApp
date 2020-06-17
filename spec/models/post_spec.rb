require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.create(:post)
  end
  it "has a valid factory" do
    puts "This post is #{@post.inspect}"
    expect(@post).to be_valid
  end
  it "is destroyed when a writer is destroyed" do
    @post.writer.destroy
    expect(Post.find_by(id: 1)).to be_nil
  end
  it "is destroyed when a target is destroyed" do
    @post.target.destroy
    expect(Post.find_by(id: 1)).to be_nil
  end
end
