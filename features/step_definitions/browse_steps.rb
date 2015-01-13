Then(/^I should be taken to the (.+) page$/) do |category|
  shop_page.category_is_selected(category)
end

Given(/^I touch the (.+) category$/) do |category|
  shop_page.goto_category(category)
end

When(/^I choose to go to the (.+) category$/) do |category|
  shop_page.goto_category_named(category)
end

Then(/^The (.+) page loads$/) do |category|
  expect(shop_page.toolbar_title.text).to match(category)
end

Given(/^I navigate to the "([^"]*)" section$/) do |section|
  shop_page.goto_category(section)
  shop_page.category_is_selected(section)
end

Then(/^all the prices should be FREE$/) do
  expect(shop_page.prices_of_free_books).not_to include( a_string_starting_with("£") )
end

And(/^there is at least one book present$/) do
  shop_page.assert_book_exists
end

Then(/^I can verify that the (.*) section has at least one book$/) do |featured_section|
  shop_page.verify_featured_section_contains_book(featured_section)
end