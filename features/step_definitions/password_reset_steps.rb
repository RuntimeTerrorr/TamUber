
When(/^I should be on password reset page$/) do
    expect(page).to have_content("Forgot Password")
end

When(/^I'm on password reset page$/) do
    '/password_resets/new'
end