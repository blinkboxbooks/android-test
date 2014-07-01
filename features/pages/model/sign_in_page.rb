class SignInPage < Page
	def initialize arg
		@email_field = Element.new('edittext_email')
		@password_field = Element.new('edittext_password')
		@signin_button = Element.new("* id:'button_signin'")
	end
	def trait
		"TextView marked:'Sign in'"
	end
	def submit_sign_in_details(user_name, password)
		@email_field.enter_text(user_name)
		@password_field.enter_text(password)
		scroll_down_with @signin_button.el,10
		@signin_button.click
	end
end
