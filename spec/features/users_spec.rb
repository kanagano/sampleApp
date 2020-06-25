
require 'rails_helper'

RSpec.feature "Users", type: :feature do
    scenario "user creates an account" do
        expect {
            sign_up

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
        expect(page).to have_content user.name

        click_link "ログアウト"

        expect(page).to have_content "ログアウトしました"
        expect(page).to have_content "ログイン"
    end
end
