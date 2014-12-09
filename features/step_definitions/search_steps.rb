Then(/^search results should be displayed$/) do
  assert_search_results @search_word
end

And(/^the author name of first book displayed should contain (.*)$/) do |author_name|
  assert_author_name author_name
end

And(/^the title of first book displayed should contain (.*)$/) do |book_title|
  assert_title book_title
end

Then(/^only one matching search result should be displayed$/) do
  assert_search_results @search_word
  assert_unique_result
end

Then /^book name should be "(.*?)"$/ do |book_title|
  assert_title book_title
end

Then /^author name should be "(.*?)"$/ do |author_name|
  assert_author_name author_name
end