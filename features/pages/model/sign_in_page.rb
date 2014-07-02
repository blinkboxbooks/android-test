class SignInPage < Page

	element :email_field, 'edittext_email'
	element :password_field, 'edittext_password'
	element :signin_button, "* id:'button_signin'"

	def trait
		"TextView marked:'Sign in'"
	end
	def submit_sign_in_details(user_name, password)
		email_field_enter_text(user_name)
		password_field_enter_text(password)
	#	scroll_down_with signin_button.el,10
		signin_button_click
	end
end
