
require 'rails_helper'

RSpec.feature "Users", type: :feature do
    scenario "user creates an account" do
        expect {
            sign_up
            newUser = User.last

            expect(page).to have_content "アカウントが作成されました"
            expect(page).to have_content newUser.name
        }.to change {User.count}.by(1)

        visit "/signup"

        expect(page).to have_content "すでにログインしています"
        expect(page).to have_current_path "/"
    end

    scenario "user logs in, edits a profile and logs out " do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        visit "/login"
        fill_in "Email", with: user1.email 
        fill_in "Password",	with: user2.password 
        click_button "Logs In"

        expect(page).to have_content "メールアドレスまたはパスワードが間違っています"
        expect(page).to have_current_path "/login"

        log_in_as user1

        expect(page).to have_content "ログインに成功しました"
        expect(page).to have_content user1.name

        visit "/login"

        expect(page).to have_content "すでにログインしています"
        expect(page).to have_current_path "/"

        click_link user1.name
        click_link "Edit profile"
        fill_in "email", with: user2.email 
        click_button "Update profile"

        expect(page).to have_current_path "/users/#{user1.id}/update"

        click_link user1.name
        click_link "Edit profile"
        fill_in "name",	with: "Peter" 
        click_button "Update profile"

        expect(page).to have_content "プロフィールを編集しました"
        expect(page).to have_current_path "/users/#{user1.id}"

        click_link "ログアウト"

        expect(page).to have_content "ログアウトしました"
        expect(page).to have_content "ログイン"
    end

    scenario "it is impossible to access to user's show and edit page without permission" do
        user1 = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)
        visit "/users/#{user1.id}"

        expect(page).to have_content "ログインが必要です"
        expect(page).to have_current_path "/login"

        visit "/users/#{user1.id}/edit"

        expect(page).to have_content "ログインが必要です"
        expect(page).to have_current_path "/login"

        log_in_as user1
        visit "/users/#{user2.id}"

        expect(page).to have_content "権限がありません"
        expect(page).to have_current_path "/"

        visit "/users/#{user2.id}/edit"

        expect(page).to have_content "権限がありません"
        expect(page).to have_current_path "/"
    end
end
