class SignInPage < BBBPage

  def trait
    "TextView marked:'Sign in'"
  end

  def sign_in_as(user_name, password)
    submit_sign_in_details(user_name, password)
    page(UserLibraryPage).await
  end

  def submit_sign_in_details(user_name, password)
    performAction('enter_text_into_id_field', user_name, 'edittext_email' )
    performAction('enter_text_into_id_field', password, 'edittext_password' )
    touch("BBBButton marked:'Sign in to find books and more'")
  end

  def goto_reset_password
    performAction("go_back")
    touch("* marked:'Forgotten your password'")
    page(ResetPasswordPage).await
  end

end