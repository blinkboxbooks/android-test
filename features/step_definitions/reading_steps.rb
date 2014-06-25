Given(/^I open the first book$/) do
	touch("* BookCover index:0")
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
