Given(/^I choose to register via the the Welcome Screen$/) do
  welcome_page.await
  welcome_page.start_registration
end