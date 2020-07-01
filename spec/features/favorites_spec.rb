require 'rails_helper'

RSpec.feature "Favorites", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @museum = FactoryBot.create(:museum)
  end

  scenario "user favors and unfavors a museum and sees favorited museums" do
    log_in_as @user
    visit "/museums"
    click_link @museum.name

    expect {
      click_link "Favorite"
    }.to change {Favorite.count}.by(1)

    visit "/users/#{@user.id}/favorites"

    expect(page).to have_content @museum.name

    visit "/museums/#{@museum.id}"

    expect {
      click_link "Unfavorite"
    }.to change {Favorite.count}.by(-1)

    visit "/users/#{@user.id}/favorites"

    expect(page).to have_content "お気に入りの美術館はまだありません"
  end

  scenario "it is impossible to favor a museum without login" do
    visit "/museums"
    click_link @museum.name
    click_link "Favorite without login"

    expect(page).to have_current_path "/login"
  end
end
