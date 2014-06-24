Given(/^the anonymous library screen is displayed$/) do
	if element_exists("* marked:'Sign in or register'")
		@anonymous_library_page = page(WelcomePage).try_application_out
	else
		puts "already signed in!"
		@anonymous_library_page = page(AnonymousLibraryPage).await
	end
	page(AnonymousLibraryPage).await.expect be_current_page	
end
When(/^I sign in$/) do
	@anonymous_library_page.goto_sign_in

	username = @testdata['existing_user']['username']
	password = @testdata['existing_user']['password']
	page(SignInPage).submit_sign_in_details(username,password)
end
Then(/^I should be on the user library screen$/) do
	@user_library_page = page(UserLibraryPage).await.expect be_current_page
end
