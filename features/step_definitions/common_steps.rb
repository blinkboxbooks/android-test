Then(/^the ([A-Za-z\-\s]*) should be displayed$/) do |page_name|
  page = page_model_class(page_name)
  expect_page(page)
end