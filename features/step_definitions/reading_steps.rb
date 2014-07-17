Given(/^I open the first book$/) do
  user_library_page.open_first_book
	book_reader_page.await
end

Then(/^I can flip pages forward$/) do
	book_reader_page.turn_page_forward(1)
end

Then(/^I can flip pages backward$/) do
	book_reader_page.turn_page_backward(1)
end
Then(/^I should be back on the user library screen$/) do
	user_libary_page.await
	expect(user_libary_page).to be_displayed
end
And(/^move (\d+) foward$/) do |arg1|
	book_reader_page.turn_page_forward(arg1)
end
And(/^move (\d+) backward$/) do |arg1|
	book_reader_page.turn_page_backward(arg1)
end

And(/^I verify that the page is not bookmarked$/) do
	expect(book_reader_page).to_not have_bookmark
end

When(/^I open the reading option$/) do
	book_reader_page.options_menu_button
end

When(/^I add a bookmark to the page$/) do
	book_reader_page.add_bookmark
end

And(/^I verify that the page is bookmarked$/) do
	expect(book_reader_page).to have_bookmark
end

Then(/^I remove the bookmark from the page$/) do
	book_reader_page.remove_bookmark
end
