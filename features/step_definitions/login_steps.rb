Given(/^I am signed in(?: as an existing user)?$/) do
  enter_app_as_existing_user
end

When(/^I sign in$/) do
  enter_app_as_existing_user
end

Given(/^I am on the User Library page$/) do
  expect_page(user_library_page)
end

When(/^I navigate to the Sign in page$/) do
  anonymous_library_page.open_menu_and_signin
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
  expect(user_library_page.signout_button).to exist
end

When(/^I go back to the Anonymous Library page$/) do
  sign_in_page.await
  sign_in_page.go_back_to_library
  anonymous_library_page.await
end

And(/^I see the Oops! and invalid email address and password error messages$/) do
  wait_for_text(test_data['errors']['oops_signin'])
  wait_for_text(test_data['errors']['invalid_email_or_password'])
  wait_for_text(test_data['errors']['try_again'])
end

And(/^the Reset password button is displayed$/) do
  expect(sign_in_page.send_reset_link_button).to exist
end

