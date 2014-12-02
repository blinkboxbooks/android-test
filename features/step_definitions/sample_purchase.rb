Then(/^I goto the "([^"]*)" category$/) do |arg|
  shop_page.goto_category(arg)
end

Then(/^I touch the FAQ option$/) do
  user_library_page.open_menu
  user_library_page.drawer_menu_section.press_info_option
end

When(/^I choose to get a free sample (.*) from the Highlights area$/) do |book|
  download_free_sample_from_shop_highlights(book)
end

And(/^I see that the sample (.*) is .n my (device|cloud)$/) do |book, library_area |
  sample_book_is_downloaded_to_my_library(book, library_area)
end

And(/^I see that the sample (.*) is there$/) do |book|
  user_library_page.choose_about_option
  expect_page(about_this_book_page)
  expect(about_this_book_page.book_title.text).to match(book)
end
