Given(/^I touch the shop icon$/) do
  user_library_page.goto_shop
end

And(/^I click on first embedded book options$/) do
  anonymous_library_page.open_option_button
end

Then(/^I should see the following links$/) do |links|
  links.rows.each { |x| expect_text(x.first) }
end

When(/^I open the drawer menu$/) do
  user_library_page.open_menu
end

When(/^I open the menu drawer$/) do
  anonymous_library_page.open_menu
end

Then(/^I should see refresh icon$/) do
  expect(anonymous_library_page.refresh_button).to exist
end

Then(/^I should see refresh image$/) do
  expect(user_library_page.refresh_button).to exist
end
