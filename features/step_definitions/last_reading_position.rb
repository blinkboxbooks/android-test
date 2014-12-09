Given(/^I have read the book to certain position$/) do
  book_reader_page.invoke_web_reader_header_and_footer
end

Given(/^I exit the book$/) do
  navigate_back_until_my_library_page_present
end

When(/^I open the book again$/) do
  read_first_book
end

Then(/^I should see last reading position$/) do
  verify_last_reading_position
end

Given(/^I have bookmarked a page$/) do
  book_reader_page.add_bookmark_via_webview_reader
end

Given(/^I continue reading turning (\d+) pages forward$/) do |pages_to_turn|
  book_reader_page.turn_pages(pages_to_turn)
  book_reader_page.invoke_web_reader_header_and_footer
end

Given(/^I tap on bookmark link$/) do
  expect(book_reader_my_bookmarks_page).to have_a_bookmark
  book_reader_my_bookmarks_page.tap_on_bookmark_link
end

Given(/^I save last reading position from my bookmarks page$/) do
  book_reader_my_bookmarks_page.tap_on_save_reading_position_button
end

Given(/^I am on bookmarked page$/) do
  expect_page(book_reader_page)
  book_reader_page.bookmark.should be_visible
  book_reader_page.back_to_saved_position.exists? and book_reader_page.dismiss_button.exists?
end

When(/^I tap on last reading position link$/) do
  book_reader_page.go_back_to_saved_reading_position
end

Then(/^I should see correct last reading position$/) do
  expect_page(book_reader_page)
  verify_last_reading_position
end

Given(/^I select a chapter link$/) do
  expect_page(book_reader_table_of_contents_page)
  book_reader_table_of_contents_page.select_chapter_link
end


Given(/^I save last reading position from TOC page$/) do
  book_reader_table_of_contents_page.tap_on_save_reading_position_button
end

Given(/^I am on selected chapter$/) do
  expect_page(book_reader_page)
end




