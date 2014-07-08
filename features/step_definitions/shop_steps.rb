Given(/^I search for "(.*?)"$/) do |arg1|
	@shop_page = page(ShopPage)
	@shop_page.search(arg1.to_s)
end
Then(/^I touch the "(.*?)" button$/) do |arg1|
	case arg1
	when "Fiction"
  @shop_page.goto_fiction
	when "Non-fiction"
	@shop_page.goto_non_fiction
	when "Categories"
	@shop_page.goto_categories
	end
end
Then(/^I should be presented with results$/) do
	@shop_page = page(ShopPage)
	@shop_page.search_has_results?.should eql true
end
