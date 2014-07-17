Given(/^I touch the shop icon$/) do
	user_library_page.goto_shop
end

Then(/^I should see the shop page$/) do
	shop_page.await
	expect(shop_page).to be_displayed
end
