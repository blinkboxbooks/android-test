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

Then(/^I should see the following links$/) do |links|
  user_library_page.links_on_drawer_menu(links)
end

Then(/^I should see the these links$/) do |links|
  anonymous_library_page.links_on_menu_drawer(links)
end

When(/^I open the drawer menu$/) do
  user_library_page.open_drawer_menu
end

When(/^I open the menu drawer$/) do
 anonymous_library_page.open_menu
end
