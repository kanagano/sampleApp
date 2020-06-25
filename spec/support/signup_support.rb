module SignupSupport
    def sign_up
        visit "/signup"
        fill_in "Name", with: "Landy"
        fill_in "Email", with: "testX@example.com"
        fill_in "Password", with: "test1234"
        click_button "Create Account"
    end
end

RSpec.configure do |config|
    config.include SignupSupport
end