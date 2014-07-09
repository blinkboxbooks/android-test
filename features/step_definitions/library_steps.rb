Given(/^I touch the shop icon$/) do
	page(UserLibraryPage).goto_shop
end

Then(/^I should see the shop page$/) do
	@shop_page = page(ShopPage).await
	expect(@shop_page).to be_displayed
end
