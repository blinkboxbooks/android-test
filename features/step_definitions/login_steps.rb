Given(/^the anonymous library screen is displayed$/) do
	if page(WelcomePage).displayed?
		@anonymous_library_page = page(WelcomePage).goto_library
	end
	@anonymous_library_page = page(AnonymousLibraryPage).await
	@anonymous_library_page.displayed?.should be true
end
When(/^I sign in$/) do
	if @anonymous_library_page.logged_out?
		@anonymous_library_page.toggle_menu_sign_in
		@sign_in_page = page(SignInPage).await
		username = test_data['users']['existing']['emailaddress']
		password = test_data['users']['existing']['password']
		@sign_in_page.submit_sign_in_details(username,password)
	end
end
Then(/^I should be on the user library screen$/) do
	@user_library_page = page(UserLibraryPage).await
	@user_library_page.displayed?.should be true
end
