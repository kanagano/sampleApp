module LoginSupport
    def log_in_as(user)
        visit "/login"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Logs In"
    end
end

RSpec.configure do |config|
    config.include LoginSupport
end