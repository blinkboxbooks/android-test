Then(/^I should see Invalid email address message$/) do

  #need to figure out the best way of handling 'wait_for' for all asserts really.
  sleep 4

  expect(rspec_sign_in_page).to have_invalid_email_address_message #just checks that has_invalid_email_address_message? returns true
  expect(rspec_sign_in_page).not_to have_invalid_password_message #just checks that has_invalid_password_message? returns true
  #the expect(rspec_sign_in_page) is actually a false positive, as all it is checking is that the methods can be executed from that page

  rspec_sign_in_page.should have_invalid_email_address_message #just checks that has_invalid_email_address_message? returns true
  rspec_sign_in_page.should_not have_invalid_password_message #just checks that has_invalid_password_message? returns false

  rspec_sign_in_page.should_not have_some_popup #this 'passes' as the should_not expects to see anything BUT true (nil or false)
  #rspec_sign_in_page.should have_some_popup #this returns 'nil' when "true", so RSpec sees this as false

  #this is actually misleading, it doesnt check the page at all, just the text, via has_text?
  expect(rspec_sign_in_page).to have_text("Invalid email address") #has_text? will return true or false

  #expect a certain page and text
  expect_page(rspec_sign_in_page)
  have_text("Invalid email address") #returns true / false (calls has_text? method)

  assert_text("Invalid email address")# true or exception...its EXACT text, no wait
  wait_for(:timeout => 5) { element_exists("* {text CONTAINS 'Invalid email address'}") } #true or false, CONTAINS, waits for 5 seconds
  wait_for(:timeout => 5) { element_exists("* marked:'Oops! There are some things below that you need to address'") }

  #this is actually misleading, it doesnt check the page at all, just the text, via has_text?
  expect(rspec_sign_in_page).not_to have_text("This text does not exist")

  #expect(rspec_sign_in_page.error_message).to have_text("Invalid email address") DOES NOT WORK

  #Useful if the cucumber step is passed "some_text"
  expect(rspec_sign_in_page.error_message.text).to eql("Invalid email address")
  expect(rspec_sign_in_page.error_message.text).to include("Invalid email address")

  rspec_sign_in_page.assert_some_popup #when this passes its 'nil' if it fails, i.e. if the method 'assert_some_popup' fails, it raises an exception

  #the below shows...(because it returns 'nil' when TRUE)
  # expected #has_some_popup? to return true, got false (RSpec::Expectations::ExpectationNotMetError)
  #sign_in_page.should have_some_popup

  #the below shows...(because it returns 'nil' when TRUE)
  #expected #has_some_popup? to return true, got false (RSpec::Expectations::ExpectationNotMetError)
  #expect(rspec_sign_in_page).to have_some_popup

  expect {rspec_sign_in_page.has_invalid_email_address_message?}.to become_true, "Message not displayed"

  rspec_sign_in_page.fake_message.wait_for_element_does_not_exist(timeout: 5) #returns nil when success
  rspec_sign_in_page.error_message.wait_for_element_exists(timeout: 5) #returns nil when success

  #Waiting section of https://github.com/calabash/calabash-android/blob/master/migrating_to_calabash_0.5.md
  wait_for_text("Already reading with us?", :timeout => 5)

  expect_text_on_screen(rspec_sign_in_page, "Get started fast")

  expect(rspec_sign_in_page.error_message.text).to satisfy { |v| v == "Invalid email address" }

  expect(rspec_sign_in_page.error_message.text).to match("Invalid email address")
end

And(/^I submit no details$/) do
  username = ""
  password = ""
  rspec_sign_in_page.submit_sign_in_details(username, password)
end