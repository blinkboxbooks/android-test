Given(/^I touch the shop icon$/) do
	user_library_page.goto_shop
end

Then(/^I should see the shop page$/) do
	shop_page.await
	expect(shop_page).to be_displayed
end

Then(/^I should see the following (.*?)$/) do |links|
  user_library_page.links_on_drawer_menu
end

When(/^I open the drawer menu$/) do
  user_library_page.open_drawer_menu
end
