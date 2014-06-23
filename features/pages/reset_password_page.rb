class ResetPasswordPage < BBBPage

  def trait
    "BBBTextView marked:'Reset your password'"
  end

  def reset_password(username)
    performAction('enter_text_into_id_field', "#{username}", 'editext_emailaddress' )
    touch("BBBButton marked:'Send reset link'")
  end

end

