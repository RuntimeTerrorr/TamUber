Given /^I visit the checklist page$/ do
  visit checklist_path
end

Then /^I cant click continue$/ do
  expect(page).to have_css('a.btn.btn-primary.disabled')
end

Then /^I can click continue$/ do
  expect(page).not_to have_css('a.btn.btn-primary.disabled')
end

When /^I check everything off the checklist$/ do
  expect(page).to have_title('Checklist | TamUber')
  
  #expect(page.find('div.col-md-6.col-md-offset-3 li.al')).to have_selector(:css, 'i.fas.fa-check')
  check 'tire_pressure'
  check 'cooling_liquid'
  check 'engine_light'
  check 'lights'
end

When /^I should not see Tire Pressure$/ do
    expect(page).to have_selector('i#tire-pressure', visible: false)
end

Then /^I click continue$/ do
  find(:css, 'a.btn.btn-primary').click
end


Then /^I should be on profile page$/ do

#   visit users_path
  expect(page).to have_title('ricky | TamUber')
end