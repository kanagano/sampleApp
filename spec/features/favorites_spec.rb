require 'rails_helper'

RSpec.feature "Favorites", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @museum = FactoryBot.create(:museum)
  end

  scenario "user favors and unfavors a museum" do
    log_in_as @user
    visit "/museums"
    click_link @museum.name

    expect {
      click_link "Favorite"
    }.to change {Favorite.count}.by(1)

    expect {
      click_link "Unfavorite"
    }.to change {Favorite.count}.by(-1)
  end

  scenario "it is impossible to favor a museum without login" do
    visit "/museums"
    click_link @museum.name
    click_link "Favorite without login"

    expect(page).to have_current_path "/login"
  end
end
