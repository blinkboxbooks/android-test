Given(/^I register and sign in as a new user$/) do
  enter_app_as_newly_registered_user
end

Given(/^I create a new user$/) do
  create_new_user
end

Given(/^I create a new user with a credit card$/) do
  create_new_user_with_credit_card
end

Given(/^I sign in as a new user with a credit card$/) do
  sign_in_new_user_with_credit_card
end