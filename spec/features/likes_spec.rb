require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
  end
  scenario "user likes a post" do
    log_in_as @user
    visit "/museums"
    click_link @post.target.name
    
    expect {
      click_link "Like #{@post.id}"
    }.to change {Like.count}.by(1)

    expect {
      click_link "Unlike #{@post.id}"
    }.to change {Like.count}.by(-1)
  end
end
