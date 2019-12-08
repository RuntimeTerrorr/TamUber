Given /^I visit the checklist page$/ do
  visit checklist_path
end

When /^I check everything off the checklist$/ do
  expect(page).to have_title('Checklist | TamUber')
  
  check 'check_tire'
  check 'check_cooling'
  check 'check_engine'
end

When /^I check "([^"]*)"$/ do |field|
  check field
end
