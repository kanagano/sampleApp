
require 'rails_helper'

RSpec.feature "Users", type: :feature do
    scenario "user creates an account" do
        visit "/signup"
        expect {
            fill_in "Name", with: "Landy"
            fill_in "Email", with: "test1@example.com"
            fill_in "Password", with: "test1234"
            click_button "Create Account"

            expect(page).to have_content "アカウントが作成されました"
        }.to change {User.count}.by(1)
    end
    scenario "user logs in and out" do
        user = FactoryBot.create(:user)
        visit "/login"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Logs In"

        expect(page).to have_content "ログインに成功しました"
        puts @current_user.inspect
        expect(@current_user.id).to eq 1

        click_link "ログアウト"

        expect(@current_user).to eq nil
    end
end
