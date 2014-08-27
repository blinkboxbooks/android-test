Given(/^I open the first book$/) do
  user_library_page.open_first_book
  book_reader_page.await
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
