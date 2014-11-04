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
  accept_terms_and_conditions(true)
end

And(/^I submit registration details$/) do
  submit_registration_details
end

And(/^I can see my name in the menu$/) do
  assert_name_in_drawer_menu
end

When /^I enter personal details with (valid|invalid) clubcard number$/ do |club_card_type|
  club_card = (test_data['clubcards']['valid_clubcard_number'])
  if club_card_type.include?('invalid')
    club_card = (test_data['clubcards']['invalid_clubcard_number'])
  end
  @email_address, @first_name, @last_name = enter_personal_details
  register_page.fill_in_club_card(club_card)
end

And /^I submit registration details by (accepting|not accepting) terms and conditions$/ do |accept_terms|
  if accept_terms.include?('not')
    accept_terms_and_conditions(false)
  else
    accept_terms_and_conditions(true)
  end
  submit_registration_details
end

When /^I try to sign in with not registered email address$/ do
  submit_sign_in_details(test_data['emails']['dummy_email'],test_data['passwords']['valid_password'])
end

When /^I try to sign in with wrong password$/ do
  submit_sign_in_details(test_data['emails']['happypath_user'], test_data['passwords']['not_matching_password'])
end

Then /^sign in is not successful$/ do
  expect_page(sign_in_page)
end