Given(/^the anonymous library screen is displayed$/) do
	if element_exists("* marked:'Sign in or register'")
		@anonymous_library_page = page(WelcomePage).try_application_out
	else
		@anonymous_library_page = page(AnonymousLibraryPage).await
	end
	page(AnonymousLibraryPage).await.should be_current_page	
end


When(/^I sign in$/) do
	pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the user library screen$/) do
	pending # express the regexp above with the code you wish you had
end
