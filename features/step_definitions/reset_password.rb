When(/^I tap on Forgotten your password link$/) do
  sign_in_page.forgotten_password_link.touch
end

Then(/^reset password popup is displayed$/) do
  expect(sign_in_page).to have_reset_your_password_popup
end

Given(/^I invoke the reset password popup$/) do
  sign_in_page.forgotten_password_link.touch
  expect(sign_in_page).to have_reset_your_password_popup
end

When(/^I enter an email address (registered|not registered) with blinkbox books$/) do |email_type|
  email_type.include?('not') ? username = test_data['emails']['dummy_email'] : username = test_data['emails']['valid']
  sign_in_page.fill_in_email_address(username)
end

When(/^I can see password reset email sent confirmation popup$/) do
  expect(sign_in_page).to have_email_sent_confirmation_popup
end

When(/^I tap on Send reset link button(?: without entering email address)?$/) do
  sign_in_page.send_reset_button.touch
end

When(/^I enter (.*) email address$/) do |invalid_email|
  sign_in_page.reset_email_field.set invalid_email
end

Then(/^I should see the enter a valid email address message$/) do
  expect(sign_in_page.error_message_for_email).to be_visible
end