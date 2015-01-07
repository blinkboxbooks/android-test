module PageObjectModel
  class SignInPage < PageObjectModel::Page

    trait "* id:'toolbar' TextView text:'Sign in'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin' text:'Sign in'"
    element :back_button, "* id:'action_bar_title' text:'Sign in'"
    element :button_register, "* id:'button_register'"
    element :send_reset_link_button, "* id:'button_send_reset'"
    element :generic_error_message, "* id:'textview_error_generic'"
    element :error_message, "* id:'textview_error'"
    element :forgotten_password_link, "* id:'textview_forgotten_password'"
    element :reset_password_popup, "* id:'alert_dialog_container'"

    #Register and sign in pop up
    element :create_my_account, "* id:'button_register' text:'Create my account'"

    #reset your password popup
    element :reset_email_field, "* id:'editext_emailaddress'"
    element :i_cant_remember_my_email_address_link, "* id:'textview_go_to_faq'"
    element :send_reset_button, "* id:'button_send' text:'Send reset link'"
    element :email_sent_ok_button, "android.widget.Button text:'OK'"
    element :error_message_for_email, "android.widget.TextView text:'Please enter a valid email address'"

    def has_register_and_signin_pop_up?
      assert_popup([
                       "* id:'alert_dialog_container'",
                       "android.widget.TextView text:'Create a free blinkbox Books account'",
                       "android.widget.TextView text:'Ready to download books to this device? Simply create a free blinkbox Books account'",
                       create_my_account.selector,
                       "android.widget.TextView text:'Already using blinkbox Books? Sign in'",
                       email_field.selector,
                       password_field.selector,
                       forgotten_password_link.selector,
                       signin_button.selector
                   ])
    end

    def has_reset_your_password_popup?
      assert_popup([
                       "* id:'parentPanel'",
                       "android.widget.TextView text:'Reset your password'",
                       "android.widget.TextView text:'Enter the email you used to register and signin, and we\\'ll email you a reset link.'",
                       reset_email_field.selector,
                       i_cant_remember_my_email_address_link.selector,
                       send_reset_button.selector
                   ])
    end

    def has_email_sent_confirmation_popup?
      assert_popup([
                       "android.widget.TextView text:'We\\'ve sent you a link'",
                       "android.widget.TextView text:'You should receive an email in the next 24 hours. Once you\\'ve chosen a new password, please try again.'",
                        email_sent_ok_button.selector
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

    def fill_in_email_address(username)
      reset_email_field.set username
    end

    def register
      button_register.scroll_to
      button_register.touch
    end
  end
end

module PageObjectModel
  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
