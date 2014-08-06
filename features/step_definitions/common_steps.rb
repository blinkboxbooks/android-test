Given(/^I have a valid user account ready to use on a new device$/) do
  device = user_interface.get_clients.first
  if device
    user_interface.deregister_client(device['client_id'].split(":").last)
  end
end

Then(/^the ([A-Za-z\-\s]*) should be displayed$/) do |page_name|
  page = page_model_class(page_name)
  expect_page(page)
end
