Given(/^I touch the shop icon$/) do
  user_library_page.goto_shop
  expect_page(shop_page)
end

And(/^I click on first embedded book options$/) do
  user_library_page.open_option_button
end

Then(/^I should see the following links$/) do |links|
  links.rows.each { |x| expect_text(x.first) }
end

When(/^I open the drawer menu$/) do
  user_library_page.open_menu
end

Then(/^I should see refresh icon$/) do
  expect(anonymous_library_page.refresh_button).to exist
end

Then(/^I should see refresh image$/) do
  expect(user_library_page.refresh_button).to exist
end

Given(/^I capture the current number of books in My Library$/) do
  @my_lib_book_count = my_library_page.current_number_of_books_in_my_library
end

Then(/^the number of books in My Library should decrease by one$/) do
  expect_page(my_library_page)
  wait_for(:timeout => 5) { expect(my_library_page.current_number_of_books_in_my_library).to be < @my_lib_book_count }
end

When(/^I choose to Remove a book from my Library$/) do
  user_library_page.remove_book_from_my_library
end

Given(/^I capture the current Books' details via the About option$/) do
  user_library_page.from_options_menu_choose("About")
  expect_page(about_this_book_page)
  @book_title = about_this_book_page.book_title.text
  @book_author = about_this_book_page.book_author.text
  press_back_button
end

Then(/^I should see the correct Contents shown$/) do
  expect_page(book_reader_table_of_contents_page)
  expect(book_reader_table_of_contents_page.title.text).to start_with(@book_title).and end_with(@book_author)
end

And(/^I open the first book on the (My Library|Reading) page$/) do |negate|
  case negate
    when "Reading"
      user_library_page.goto_reading_tab
    when "My Library"
      user_library_page.goto_my_library_tab
    else
      fail "Unsupported button '#{negate}' in the User library area"
  end
  user_library_page.open_first_book
  wait_for_book_reader_page
end

Given(/^I capture the current number of books in Reading$/) do
  @my_lib_reading_book_count = reading_page.current_number_of_books_in_reading
end

And(/^I navigate to (.*) in the user library drawer menu$/) do |drawer_menu_item|
  user_library_page.goto_drawer_option(drawer_menu_item)
end

Then(/^the page contains (.*) in the toolbar header$/) do |toolbar_title|
  expect_toolbar_title_to_equal(toolbar_title)
end

And(/^I navigate to shop$/) do
  enter_app_as_anonymous_user
  user_library_page.goto_shop
  expect_page(shop_page)
end