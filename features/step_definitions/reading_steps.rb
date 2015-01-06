Given(/^I open the first book$/) do
  user_library_page.open_first_book
  wait_for_book_reader_page
end

Then(/^I should be back on the user library screen$/) do
  user_library_page.await
  expect(user_library_page).to be_displayed
end

And(/turn (\d+) pages forward$/) do |pages_to_turn|
  book_reader_page.turn_pages(pages_to_turn)
end

And(/turn (\d+) pages backward$/) do |pages_to_turn|
  book_reader_page.turn_pages(-pages_to_turn.to_i.abs)
end

Given(/^I choose "([^"]*)" from the Options menu$/) do |option|
  user_library_page.from_options_menu_choose(option)
end

Given(/^I invoke the definition functionality on the reader$/) do
  book_reader_page.invoke_definition_popup
end

Then(/^I should be shown a definition$/) do
  expect(book_reader_page).to have_popup_definition
  @book_reader_page_lookup_word = book_reader_page.lookup_word.webview_text
  @book_reader_page_lookup_definition = book_reader_page.lookup_definition.webview_text
end

And(/^It should be included in the full definition page$/) do
  book_reader_page.goto_full_definitions_page
  expect(book_reader_page).to have_full_definitions
  @book_reader_definition_page_lookup_word = book_reader_page.definition_page_lookup_word.webview_text
  @book_reader_definition_page_lookup_definition = book_reader_page.definition_page_lookup_definition.webview_text
  expect(@book_reader_page_lookup_word).to match(@book_reader_definition_page_lookup_word)
  expect(@book_reader_page_lookup_definition).to match(@book_reader_definition_page_lookup_definition)
end

Then(/^I choose to read the first book$/) do
  read_first_book
end

Then(/^number of books I am reading should equal (\d+)$/) do |books_reading|
  wait_for(:timeout => 5) { expect(reading_page.current_number_of_books_in_reading).to eql(books_reading.to_i)}
end

When(/^I go to the Reading page$/) do
  user_library_page.goto_reading_tab
  expect_page(reading_page)
end

When(/^I go back to the User Library Reading Page$/) do
  navigate_back_until_user_library_reading_page_present
end

And(/^I should see the Empty Reading Page$/) do
  expect_page(empty_reading_page)
end

And(/^I set the book slider position to (\d+)$/) do |position|
  book_reader_page.move_slider_to_position(position)
end

And(/^I set the book slider position back to (\d+)$/) do |position|
  book_reader_page.move_slider_to_position(position, :left)
end

And(/^I go to end of the book$/) do
  go_to_end_of_the_book
end

When(/^I choose to purchase the book$/) do
  end_of_book_page.click_on_buy_button
end

When(/^I click on shop for more books button$/) do
  end_of_book_page.click_on_shop_for_more_books_button
end

When(/^I click to go back to library screen$/) do
  end_of_book_page.click_on_go_to_library_button
end

When(/^I click on to view more books$/) do
  end_of_book_page.click_on_view_more_books_in_the_shop
end

When(/^I click on book that I like to see$/) do
  end_of_book_page.click_on_more_books_you_like_book_cover
end

Then(/^shop screen is displayed$/) do
  expect_page(shop_page)
end

Then(/^library screen is displayed$/) do
  expect_page(my_library_page)
end

Then(/^goes to search result screen$/) do
  expect_activity("SearchActivity")
end

And(/^I remove the book$/) do
  end_of_book_page.remove_sample
end

And(/^I am prompted to register and proceed$/) do
  register_via_create_bbb_account_pop_up
end

And(/^how would like to pay pop up is displayed$/) do
  expect(shop_page).to have_would_you_like_to_pay_popup
end

And(/^I capture progress and chapter$/) do
  book_reader_page.get_header_and_footer_text
end

And(/^I close the reader slider$/) do
  book_reader_page.close_web_reader_header_and_footer
end

