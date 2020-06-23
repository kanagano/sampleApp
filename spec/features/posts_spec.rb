require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  include LoginSupport
  before do
    @user = FactoryBot.create(:user)
    @museum = FactoryBot.create(:museum)
  end
  scenario "user writes a post" do
    log_in_as @user
    visit "/museums"
    click_link @museum.name
    click_link "クチコミを投稿する"

    expect {
      select 3, from: "Rate"
      fill_in "Content", with: "Good"
      click_button "Submit post"
      expect(page).to have_content "クチコミが投稿されました"
    }.to change {Post.count}.by(1)
  end
end
