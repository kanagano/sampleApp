require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  include LoginSupport
  before do
    @user = FactoryBot.create(:user)
    @museum = FactoryBot.create(:museum)
  end
  scenario "user writes and edits a post" do
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

    click_link "編集"
    select 1, from: "Rate"
    fill_in "Content", with: "Bad"
    click_button "Edit post"

    post = Post.find_by(id: 1)
    expect(page).to have_content "クチコミを編集しました"
    expect(post.star).to eq 1
    expect(post.content).to eq "Bad"
  end
end
