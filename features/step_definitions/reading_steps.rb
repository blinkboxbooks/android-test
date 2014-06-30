Given(/^I open the first book$/) do
	page(BookReaderPage).open_first_book
	@book_reader_page = page(BookReaderPage).await
end

Then(/^I can flip pages forward$/) do
	@book_reader_page.turn_page_forward(1)
end

Then(/^I can flip pages backward$/) do
	@book_reader_page.turn_page_backward(1)
end
Then(/^I should be back on the user library screen$/) do
	page(UserLibraryPage).await.expect be_current_page
end
And(/^move (\d+) foward$/) do |arg1|
	@book_reader_page.turn_page_forward(arg1)
	sleep(1) #Allow for animation time to finish
end
And(/^move (\d+) backward$/) do |arg1|
	@book_reader_page.turn_page_backward(arg1)
	sleep(1) #Allow for animation time to finish
end

And(/^I verify that the page is not bookmarked$/) do
	@book_reader_page.has_bookmark?.should eql false
end

When(/^I open the reading option$/) do
	@book_reader_page.options_menu_button
end

When(/^I add a bookmark to the page$/) do
	@book_reader_page.add_bookmark
end

And(/^I verify that the page is bookmarked$/) do
	@book_reader_page.has_bookmark?.should eql true
end

Then(/^I remove the bookmark from the page$/) do
	@book_reader_page.remove_bookmark
end

