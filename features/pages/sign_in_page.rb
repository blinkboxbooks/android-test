class SignInPage < BBBPage

  def trait
    "TextView marked:'Sign in'"
  end

  def submit_sign_in_details(user_name, password)
    performAction('enter_text_into_id_field', user_name, 'edittext_email' )
    performAction('enter_text_into_id_field', password, 'edittext_password' )
	scroll_down_with "* id:'button_signin'",10
	touch("* id:'button_signin'")
  end
end
