require 'rails_helper'

RSpec.feature "Museums", type: :feature do
  before do
    @museum = FactoryBot.create(:create)
  end
  scenario "user sees museums" do
    visit "/museums"
    click_link @museum.name
    expect(page).to have_current_path "/museums/1"
  end
end
