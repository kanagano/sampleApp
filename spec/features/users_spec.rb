
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "user creates" do
    user = FactoryBot.create(:user)
    museum = FactoryBot.create(:museum)
    
    visit ('/')
    click_link "ログイン"
    fill_in "email",	with: user.email 
    fill_in "password",	with: user.password
    click_button "ログイン"

    click_link "施設を探す"
    click_link museum.name

    expect {
      click_link "クチコミを投稿する"
      fill_in "content", with: "Very good"
      click_button "投稿"
    }.to change(user.posts, :count).by(1)
  end
end
