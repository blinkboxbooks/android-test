Given(/^I am on the Sign in page$/) do
  expect_page(sign_in_page)
end

When(/^I tap on Forgotten your password link$/) do
  sign_in_page.tap_forgotten_password_link
end

Then(/^reset password popup is displayed$/) do
  expect(sign_in_page).to have_reset_your_password_popup
end

Given(/^I can see reset password popup$/) do
  expect_page(sign_in_page)
  sign_in_page.tap_forgotten_password_link
  expect(sign_in_page).to have_reset_your_password_popup
end

When(/^I enter email address registered with blinkbox books$/) do
  username = test_data['users']['existing']['emailaddress']
  sign_in_page.fill_in_email_address(username)
end

When(/^I tap on Send reset link button$/) do
  sign_in_page.tap_send_reset_link
end

When(/^I can see password reset email sent confirmation popup$/) do
  expect(sign_in_page).to have_email_sent_confirmation_popup
end

When(/^I enter email address not registered with blinkbox books$/) do
  username = test_data['emails']['dummy_email']
  sign_in_page.fill_in_email_address(username)
end

When(/^I tap on Send reset link button without entering email address$/) do
  sign_in_page.tap_send_reset_link
end

Then(/^I should see an error message$/) do
  sign_in_page.error_message_for_email_address
end

When(/^I enter (.*) email address$/) do |invalid_email|
  sign_in_page.email_address_reset_field.set invalid_email
end
