Given(/^I open the first book$/) do
  user_library_page.open_first_book
	book_reader_page.await
end
Then(/^I should be back on the user library screen$/) do
  user_library_page.await
	expect(user_library_page).to be_displayed
end
And(/^move (\d+) foward$/) do |pages_to_turn|
	book_reader_page.turn_page(pages_to_turn)
end
And(/^move (-\d+) backward$/) do |pages_to_turn|
	book_reader_page.turn_page(pages_to_turn)
end

And(/^I verify that the page is not bookmarked$/) do
	expect(book_reader_page).to_not have_bookmark
end

When(/^I open the reading option$/) do
	book_reader_page.options_menu_button
end

When(/^I add a bookmark to the page$/) do
	book_reader_page.toggle_bookmark
end

And(/^I verify that the page is bookmarked$/) do
	expect(book_reader_page).to have_bookmark
end

Then(/^I remove the bookmark from the page$/) do
	book_reader_page.toggle_bookmark
end
