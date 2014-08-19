Given(/^I touch the shop icon$/) do
  user_library_page.goto_shop
end

And(/^I click on first embedded book options$/) do
  anonymous_library_page.open_option_button
end

Then(/^I should see the following$/) do |table|
  table.rows.each do |x|
    anonymous_library_page.option_exists?(x.first)
  end

end
