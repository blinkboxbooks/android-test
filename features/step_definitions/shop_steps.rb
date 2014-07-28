When(/^I enter \"([^\"]*)\" as the search term$/) do |search_string|
	shop_page.await
	shop_page.search_suggestions_for(search_string)
end

Then(/^I touch the "(.*?)" button$/) do |button_name|
	case button_name
	when "Fiction"
		shop_page.goto_fiction
	when "Non-fiction"
		shop_page.goto_non_fiction
	when "Categories"
		shop_page.goto_categories
	else
		raise "Unsupported button '#{button_name}' on the Shop page"
	end
end

Then(/^I should see search suggestions$/) do
	shop_page.await
	expect(shop_page).to have_search_suggestions
end
