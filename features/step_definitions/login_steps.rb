Given(/^I am signed in(?: as an existing user)?$/) do
  enter_app_as_existing_user
end

When(/^I sign in$/) do
  enter_app_as_existing_user
end

When(/^I navigate to the Sign in page$/) do
  my_library_page.open_menu_and_signin
  sign_in_page.await
end

When(/^I submit valid sign in details$/) do
  username = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  sign_in_page.submit_sign_in_details(username, password)
end

Then(/^I use drawer menu to sign out$/) do
  user_library_page.sign_out
end

When(/^I Sign out$/) do
  user_library_page.sign_out
end

Then(/^I should see sign in option in the drawer menu$/) do
  anonymous_library_page.open_menu
  expect(anonymous_library_page.signin_button).to exist
end

Then(/^I should see sign out option in the drawer menu$/) do
  user_library_page.open_menu
  expect(user_library_page.user_library_drawer_menu.signout_button).to exist
end

And(/^I see the Oops! and invalid email address and password error messages$/) do
  expect(sign_in_page).to have_incorrect_credentials_popup
end

And(/^the Reset password button is displayed$/) do
  expect(sign_in_page.send_reset_link_button).to exist
end

And(/^I go back to the My Library page$/) do
  go_back_to_my_library_page_from_signin_page
end

And(/^I am on the My Library page$/) do
  expect_page(my_library_page)
end

Given(/^I am signed in as a user who has a credit card$/) do
  @email_address, @password = api_helper.create_new_user!
  @name_on_card = api_helper.add_credit_card
  @card_type = 'VISA'
  @card_count = 1
  #sign in as a user with the cc
  #await the my library screen
end

Given(/^I am signed in as a new user$/) do
  @email_address, @password = api_helper.create_new_user!
  enter_app_as(@email_address, @password)
end