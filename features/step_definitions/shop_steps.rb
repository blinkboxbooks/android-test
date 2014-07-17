Given(/^I search for "(.*?)"$/) do |search_string|
  shop_page.await
  shop_page.search(search_string)
end
Then(/^I touch the "(.*?)" button$/) do |button_name|
  case button_name
    when "Fiction"
      shop_page.goto_fiction
    when "Non-fiction"
      shop_page.goto_non_fiction
    when "Categories"
      shop_page.goto_categories
  end
end
Then(/^I should be presented with results$/) do
  shop_page.await
  expect(shop_page).to have_search_results
end
