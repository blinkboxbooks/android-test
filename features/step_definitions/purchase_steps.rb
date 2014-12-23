Given(/^I choose to purchase a book from the "([^"]*)" section$/) do |arg|
  pending
  #this will goto the relevent section, make sure its there
  #by default this will purchase a random book....create this method
end

And(/^I use my default card$/) do
  wait_for(:timeout => 5) { expect(user_library_page).to have_saved_card_popup }
  tap_on_saved_card
end

When(/^I complete the purchase$/) do
  wait_for(:timeout => 5) { expect(user_library_page).to have_payment_confirmation_popup }
  tap_on_pay_now_button
end

And(/^I choose to go My Library$/) do
  wait_for(:timeout => 5) { expect(user_library_page).to have_new_book_downloading_popup }
  tap_on_goto_my_library_button
end

Then(/^The I can see the newly purchased book added to My Library$/) do
  pending
  #wait to be redirected to my library and the count should increment by one
end

And(/^I can verify its contents$/) do
  pending
  #open the first books' about page via options menu
end

Given(/^I am on user library page$/) do
  expect_page(MyLibraryPage)
end

When(/^I choose to purchase first book using options button$/) do
  signin_user_purchase_first_book
end

Then(/^I should not see buy option in Options menu$/) do
  expect(user_library_page)
  user_library_page.open_first_book_options
  user_library_page.user_library_options_menu.buy_full_ebook.should_not be_visible
end