class SignInPage < Page
	trait "TextView marked:'Sign in'"
	element :email_field, 'edittext_email'
	element :password_field, 'edittext_password'
	element :signin_button, "* id:'button_signin'"

	def submit_sign_in_details(user_name, password)
		performAction('enter_text_into_id_field',user_name,email_field.selector)
		performAction('enter_text_into_id_field',password,password_field.selector)
		scroll_down_with signin_button.selector,10
		touch(signin_button.selector)
	end
end
