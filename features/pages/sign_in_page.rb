module PageObjectModel
  class SignInPage < PageObjectModel::Page

    trait "* id:'toolbar' TextView text:'Sign in'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin'"
    element :back_button, "* id:'action_bar_title' text:'Sign in'"
    element :button_register, "* id:'button_register'"
    element :send_reset_link_button, "* id:'button_send_reset'"
    element :generic_error_message, "* id:'textview_error_generic'"
    element :error_message, "* id:'textview_error'"

    #reset your password popup
    element :email_address_reset_field, "* id:'editext_emailaddress' text:'the email adderess you have entered'"
    element :i_cant_remember_my_email_address_link, "* id:'textview_go_to_faq' text:'I can't remember my email address either!'"
    element :send_reset_button, "* id:'button_send' text:'Send reset link'"

    def has_reset_your_password_popup?
      assert_popup([
                       "* id:'parentPanel'",
                       "android.widget.TextView text:'Reset your password'",
                       "android.widget.TextView text:'Enter the email you used to register, and we'll email you a reset link.'",
                       email_address_reset_field.selector,
                       i_cant_remember_my_email_address_link.selector,
                       send_reset_button.selector
                   ])
    end

    def has_incorrect_credentials_popup?
      expect_text(test_data['errors']['oops_signin'])
      expect_text(test_data['errors']['invalid_email_or_password'])
    end

    def submit_sign_in_details(user_name, password)
      email_field.scroll_to
      email_field.set user_name
      password_field.scroll_to
      password_field.set password
      signin_button.scroll_to
      signin_button.touch
    end

    def register
      button_register.touch
    end

  end
end

module PageObjectModel
  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
