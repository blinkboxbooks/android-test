Given(/^I search for "(.*?)"$/) do |arg1|
	@shop_page = page(ShopPage)
	@shop_page.search(arg1.to_s)
end

Then(/^I should be presented with results$/) do
	@shop_page.search_has_results?.should eql true
end
