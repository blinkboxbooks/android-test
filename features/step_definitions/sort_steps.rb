Then(/^the book titles should be sorted by Title A \- Z$/) do
  expect(shop_page.titles_of_books).to eql(shop_page.page_book_titles_sorted)
end

Then(/^the book titles should be sorted by Title Z \- A$/) do
  expect(shop_page.titles_of_books).to eql(shop_page.page_book_titles_reversed)
end

Then(/^the book titles should be sorted by Sort by Price: \(Low \- High\)$/) do
  expect(shop_page.pre_discount_price).to eql(shop_page.page_book_prices_sorted)
end

Then(/^the book titles should be sorted by Price: \(High \- Low\)$/) do
  expect(shop_page.pre_discount_price).to eql(shop_page.page_book_prices_reversed)
end

When(/^I sort books by "([^"]*)" order$/) do |sort_option|
  shop_page.sort_books_by(sort_option)
end