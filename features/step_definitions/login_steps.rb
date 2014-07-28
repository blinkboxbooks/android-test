Given(/^the anonymous library screen is displayed$/) do
  if welcome_page.displayed?
    welcome_page.goto_library
  end
  anonymous_library_page.await
  expect(anonymous_library_page).to be_displayed
end

When(/^I sign in$/) do
  if anonymous_library_page.logged_out?
    anonymous_library_page.toggle_menu_and_signin
    sign_in_page.await
    sign_in_page.submit_sign_in_details( test_data['users']['existing'] \
    ['emailaddress'],test_data['users']['existing']['password'])
  end
end

Then(/^I should be on the user library screen$/) do
  user_library_page.await
  expect(user_library_page).to be_displayed
end
