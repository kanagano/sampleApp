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
      fill_in "Content", with: "Good"
      click_button "Submit post"
      expect(page).to have_content "正しい値を入力してください"
      expect(page).to have_current_path "/posts/#{@museum.id}/create"
    }.to change {Post.count}.by(0)

    visit "/posts/#{@museum.id}/new"

    expect {
      select 3, from: "Rate"
      fill_in "Content", with: "Good"
      click_button "Submit post"
      expect(page).to have_content "クチコミが投稿されました"
      expect(page).to have_current_path "/museums/#{@museum.id}"
    }.to change {Post.count}.by(1)

    visit "/museums/#{@museum.id}/new"

    expect(page).to have_content "すでにクチコミが存在します"
    expect(page).to have_current_path "/museums/#{@museum.id}"

    post = Post.last
    click_link "編集"
    select 1, from: "Rate"
    fill_in "Content", with: ""
    click_button "Edit post"

    expect(page).to have_content "正しい値を入力してください"
    expect(page).to have_current_path "/posts/#{post.id}/update"

    visit "/posts/#{post.id}/edit"
    select 1, from: "Rate"
    fill_in "Content", with: "Bad"
    click_button "Edit post"

    expect(page).to have_content "クチコミを編集しました"
    expect(page).to have_current_path "/museums/#{post.museum_id}"
    expect(post.star).to eq 1
    expect(post.content).to eq "Bad"
  end

  scenario "it is impossible to write a post without login and edit other's post" do
    post = FactoryBot.create(:post)
    visit "/museums/#{@museum.id}/new"

    expect(page).to have_content "ログインが必要です"
    expect(page).to have_current_path "/login"

    log_in_as @user
    visit "/posts/#{post.id}/edit"

    expect(page).to have_content "権限がありません"
    expect(page).to have_current_path "/users/#{@user.id}"
  end
end
