Given(/^I am on user page$/) do |place|
  visit('/users/#{place}')
end
Then(/^I should see a map$/) do
    expect(page).to have_css '#map'
end