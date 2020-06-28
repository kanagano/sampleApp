require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  before do
    @post = FactoryBot.create(:post)
    @user = FactoryBot.create(:user)
  end
  scenario "user receives a notification when sign up" do
    expect {
      sign_up
      click_link "New notification"

      expect(page).to have_content "信州美博Webへようこそ！"
    }.to change {Notification.count}.by(1)
  end
  scenario "user receives a notification when posts liked" do
    log_in_as @user
    visit "/museums"
    click_link @post.target.name

    expect {
      click_link "Like #{@post.id}"
      click_link "ログアウト"
      log_in_as @post.writer
      click_link "New notification"

      expect(page).to have_content "#{@user.name}さんがあなたの投稿にいいねしました"
    }.to change {Notification.count}.by(1)
  end
end
