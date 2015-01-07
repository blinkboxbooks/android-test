Given(/^I choose to purchase a book from the "([^"]*)" section$/) do |arg|
  pending
  #this will goto the relevent section, make sure its there
  #by default this will purchase a random book....create this method
end

And(/^I use my default card$/) do
  wait_for { expect(user_library_page).to have_saved_card_popup }
  tap_on_saved_card
end

When(/^I complete the purchase$/) do
  wait_for { expect(user_library_page).to have_payment_confirmation_popup }
  tap_on_pay_now_button
end

And(/^I choose to go My Library$/) do
  wait_for { expect(user_library_page).to have_new_book_downloading_popup }
  tap_on_goto_my_library_button
  expect(user_library_page)
end

Then(/^I can see the newly purchased book added to My Library$/) do
  tap_on_goto_my_library_button
  expect(user_library_page)
  verify_purchased_book_in_library
end

And(/^I can verify its contents$/) do
  pending
  #open the first books' about page via options menu
end

Given(/^I am on user library page$/) do
  expect_page(user_library_page)
end

When(/^I choose to purchase first book using options button$/) do
  user_purchase_first_book
end

Then(/^I should not see buy option in Options menu$/) do
  user_library_page.open_first_book_options
  user_library_page.user_library_options_menu.buy_full_ebook.should_not be_visible
end

And(/^I choose to purchase a (free|paid) book$/) do |book_type|
  book_type.include?('paid')? shop_page.select_book_for_purchase : shop_page.select_free_book_for_purchase
end

Then(/^the add new card pop up is displayed$/) do
  wait_for{ expect(shop_page).to have_add_new_card_popup }
end

Then(/^I should see the Your new book is downloading popup$/) do
  wait_for{ expect(shop_page).to have_new_book_downloading_popup }
end

Then(/^I should see the Welcome to blinkbox books popup$/) do
  wait_for{ expect(shop_page).to have_welcome_to_blinkbox_books_popup }
end

And(/^I pay with a new (.*?) card$/) do |card_type|
  pay_with_a_new_card(card_type)
end