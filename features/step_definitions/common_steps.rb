Given(/a valid user account(?: ready for use on a new device)$/) do
  device = user_interface.get_clients.first
  if device
    user_interface.deregister_client(device['client_id'].split(":").last)
  end
end

Given(/^the anonymous library screen is displayed$/) do
  enter_app_as_anonymous_user()
  expect_page(anonymous_library_page)
end

Then(/^the ([A-Za-z\-\s]*) should be displayed$/) do |page_name|
  page = page_model_instance(page_name)
  expect_page(page)
end
