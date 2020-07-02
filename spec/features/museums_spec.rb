require 'rails_helper'

RSpec.feature "Museums", type: :feature do
  before do
    @museum = FactoryBot.create(:museum)
  end
  scenario "user sees and searches museums " do
    visit "/museums"
    click_link @museum.name

    expect(page).to have_current_path "/museums/1"

    visit "/museums"
    fill_in "Museum name",	with: "Museum" 
    click_button "Search museum"

    expect(page).to have_content "”Museum”を含む検索結果一覧"

    visit "/museums"
    fill_in "Museum name",	with: "" 
    click_button "Search museum"

    expect(page).to have_content "検索ワードを含む美術館は見つかりませんでした"

    visit "/museums"
    fill_in "Museum name",	with: "Chocolate" 
    click_button "Search museum"

    expect(page).to have_content "検索ワードを含む美術館は見つかりませんでした"
  end
end
