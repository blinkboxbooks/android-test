Given(/^I choose to add a bookmark using the Book Reader page$/) do
  book_reader_page.add_bookmark_via_webview_reader
end

When(/^I visit the "([^"]*)" page from the Bookmark Reader option menu$/) do |drawer_option|
  book_reader_page.choose_option_from_reading_menu(drawer_option)
end

And(/^My bookmarks page should have a bookmark$/) do
  expect(book_reader_my_bookmarks_page).to have_a_bookmark
end

And(/^The bookmarks' details should match the details shown in the Book Reader popup$/) do
  expect(book_reader_my_bookmarks_page.bookmark_book_title.text).to match(book_reader_page.book_chapter)
  expect(book_reader_my_bookmarks_page.bookmark_book_progress).to start_with(book_reader_page.book_progress)
end

And(/^I choose to remove a bookmark using the Book Reader page toolbar$/) do
  book_reader_page.remove_bookmark_via_toolbar
end

Given(/^I choose to add a bookmark using the drawer menu on the Book Reader page$/) do
  book_reader_page.goto_bookmark_this_page
end

When(/^I delete the first bookmark$/) do
  book_reader_my_bookmarks_page.delete_first_bookmark
end

And(/^the Book Reader page should not have a bookmark$/) do
  go_back_to_book_reader_page
  book_reader_page.bookmark.should_not be_visible
end

Then(/^The Empty Bookmarks page should be seen$/) do
  expect_page(book_reader_empty_my_bookmarks_page)
end

Then(/^The My bookmarks page should be seen$/) do
  expect_page(book_reader_my_bookmarks_page)
end

Given(/^I choose to add a bookmark using the Book Reader page toolbar$/) do
  book_reader_page.add_bookmark_via_toolbar
end