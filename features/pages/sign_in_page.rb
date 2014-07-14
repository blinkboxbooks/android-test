class SignInPage < Page
	trait "TextView marked:'Sign in'"
	element :email_field, "* id:'edittext_email'"
	element :password_field, "* id:'edittext_password'"
	element :signin_button, "* id:'button_signin'"

	def submit_sign_in_details(user_name, password)
		email_field.enter_text user_name
		password_field.enter_text password
		scroll("android.widget.ScrollView", :down)
		signin_button.click
	end
end
