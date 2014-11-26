When(/^I enter (.*) as the search term$/) do |search_string|
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
    fail "Unsupported button '#{button_name}' on the Shop page"
  end
end

Then(/^I should see search suggestions$/) do
  expect(shop_page.search_suggestions).to be_visible
end

Then(/^I should see the shop page$/) do
  shop_page.await
end

And(/^I navigate back until I get to the My Library page$/) do
  navigate_back_until_my_library_page_present
end

Then(/^I should see (.+) in the search suggestions$/) do |search_string|
  expect(shop_page.search_results).to include(search_string)
end