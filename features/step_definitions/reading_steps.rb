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