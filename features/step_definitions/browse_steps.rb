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

And(/^I navigate to the "([^"]*)" section$/) do |section|
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

When(/^I see correct author name on the screen$/) do
  expect_page(shop_author_details_page)
  expect(shop_author_details_page.author_name.text).to match(shop_book_description_page.book_description_author_name)
end

And(/^I capture book details via book description screen$/) do
  capture_book_details_on_book_description_screen
end

When(/^I click on have a look inside link$/) do
  shop_book_description_page.click_on_have_a_look_inside_link
end

Then(/^I see correct book details on reader screen$/) do
  expect_page(book_reader_page)
  go_to_end_of_sample_book
  expect(end_of_sample_book_page.book_title.text).to match(shop_book_description_page.book_description_book_name)
  expect(end_of_sample_book_page.book_author.text).to match(shop_book_description_page.book_description_author_name)
end

And(/^I click on see other books written by author$/) do
  shop_author_details_page.click_on_all_books_by_this_author
end

Then(/^search result page is displayed$/) do
  expect_page(search_results_page)
end

And(/^I capture author name on book description screen$/) do
  capture_book_details_on_book_description_screen
end

When(/^I click on author title link$/) do
  shop_book_description_page.click_on_author_title_link
end

When(/^I click on author link on book description screen$/) do
  open_book_and_click_on_author_link
end

When(/^I swipe to go to author screen$/) do
  pan_left
end

And(/^search result heading matches author name$/) do
  expect(search_results_page.search_result_heading.text).to match(shop_book_description_page.book_description_author_name)
end

Given(/^I navigate to shop and buy "([^"]*)"$/) do |category|
  register_and_buy_free_book(category)
end
