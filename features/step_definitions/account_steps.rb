Given(/^I choose to register via the the Welcome Screen$/) do
  welcome_page.await
  register_via_welcome_screen
end

When(/^I enter valid personal details$/) do
  @email_address, @first_name, @last_name = enter_personal_details
end

And(/^I choose a valid password$/) do
  enter_password(test_data['passwords']['valid_password'])
end

And(/^I accept terms and conditions$/) do
  set_terms_and_conditions(true)
end

And(/^I submit registration details$/) do
  submit_registration_details
end

And(/^I can see my name in the menu$/) do
  assert_name_in_drawer_menu
end

When /^I enter personal details with a (valid|invalid) clubcard number$/ do |clubcard_type|
  clubcard = test_data['clubcards']["#{clubcard_type}_clubcard_number"]
  @email_address, @first_name, @last_name = enter_personal_details
  register_page.fill_in_clubcard(clubcard)
end

When(/^I have registered and signed in as new user$/) do
  my_library_page.open_menu_and_register
  register_as_new_user
end

And /^I submit registration details by (accepting|not accepting) terms and conditions$/ do |accept_terms|
  accept_terms.include?('not') ? set_terms_and_conditions(false) : set_terms_and_conditions(true)
  submit_registration_details
end

When /^I try to sign in with an unregistered email address$/ do
  submit_sign_in_details(test_data['emails']['dummy_email'], test_data['passwords']['valid_password'])
end

When /^I try to sign in with an incorrect password$/ do
  submit_sign_in_details(test_data['emails']['happypath_user'], test_data['passwords']['not_matching_password'])
end

Then /^sign in is not successful$/ do
  expect_page(sign_in_page)
end