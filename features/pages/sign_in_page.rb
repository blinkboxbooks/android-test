class SignInPage < Page
	trait "TextView marked:'Sign in'"
	element :email_field, "* id:'edittext_email'"
	element :password_field, "* id:'edittext_password'"
	element :signin_button, "* id:'button_signin'"
	
	def submit_sign_in_details(user_name, password)
		enter_text email_field.selector, user_name
		enter_text password_field.selector, password
		scroll("android.widget.ScrollView", :down)
		touch signin_button.selector
	end
end
