Given(/^I choose to purchase a book from the "([^"]*)" section$/) do |arg|
  pending
  #this will goto the relevent section, make sure its there
  #by default this will purchase a random book....create this method
end

And(/^I use my default card$/) do
  pending
  #wait for the how would you like to pay popup and hit the confirm area
end

When(/^I complete the purchase$/) do
  pending
  #wait for the pay now popup and hit the pay now
end

And(/^I choose to go My Library$/) do
  pending
  #wait for the your new book is downloading
  #hit the goto my library
end

Then(/^The I can see the newly purchased book added to My Library$/) do
  pending
  #wait to be redirected to my library and the count should increment by one
end

And(/^I can verify its contents$/) do
  pending
  #open the first books' about page via options menu
end