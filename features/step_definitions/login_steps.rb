Given(/^the anonymous library screen is displayed$/) do
  enter_app_as_anonymous_user()
  expect_page(anonymous_library_page)
end

When(/^I sign in$/) do
  if anonymous_library_page.logged_out?
    anonymous_library_page.open_menu_and_signin
    sign_in_page.await
    username = test_data['users']['existing']['emailaddress']
    password = test_data['users']['existing']['password']
    sign_in_page.submit_sign_in_details(username, password)
  end
end

Then(/^I should be on the user library screen$/) do
  user_library_page.await
  expect(user_library_page)
end

When(/^I use drawer menu to sign out$/) do
  user_library_page.open_drawer_menu_and_signout
end

Then(/^I should see sign in option in drawer menu$/) do
  anonymous_library_page.await
  expect_page(anonymous_library_page)
  anonymous_library_page.open_menu
end

Then(/^I should be on anonymous library screen$/) do
  expect_page(anonymous_library_page)
end

Then(/^I should be on sign in screen$/) do
  expect_page(sign_in_page)
end

Then(/^I should see the sign in option$/) do
  open_menu
end

Given(/^I am an existing user$/) do
  if anonymous_library_page.logged_out?
    anonymous_library_page.open_menu_and_signin
    sign_in_page.await
    username = test_data['users']['existing']['emailaddress']
    password = test_data['users']['existing']['password']
    sign_in_page.submit_sign_in_details(username, password)
    user_library_page.await
    expect_page(user_library_page)
  end
end
