Given(/^I create a new user with a credit card$/) do
  @email_address, @password = api_helper.create_new_user!
  puts @email_address
  puts @password
  @name_on_card = api_helper.add_credit_card
end

Given(/^I register and sign in as a new user$/) do
  enter_app_as_newly_registered_user
end