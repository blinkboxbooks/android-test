Then(/^I should be taken to the (.*) page$/) do |category|
  shop_page.category_is_selected(category)
end

Given(/^I touch the (.*) category$/) do |category|
  shop_page.goto_category(category)
end

When(/^I choose to goto the (.*) category$/) do |category|
  shop_page.goto_category_named(category)
end

Then(/^That (.*) page loads$/) do |category|
  expect(shop_page.toolbar_title.text).to match(category)
end

Given(/^I navigate to the "([^"]*)" section$/) do |section|
  shop_page.goto_category(section)
  shop_page.category_is_selected(section)
end

Then(/^all the prices should be FREE$/) do
  expect(shop_page.prices_of_books).not_to include( a_string_starting_with("£") )
end

And(/^There is at least one book present$/) do
  shop_page.assert_book_exists
end