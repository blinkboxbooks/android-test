module PageObjectModel
  class RSpecSignInPage < PageObjectModel::Page
    trait "* id:'action_bar_title' text:'Sign in'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin'"
    #element :back_button, "* text:'Sign in'"
    element :button_register, "* id:'button_register'"
    element :send_reset_link_button, "* id:'button_send_reset'"
    element :generic_error_message, "* id:'textview_error_generic'"
    element :error_message, "* id:'textview_error'"

    def submit_sign_in_details(user_name, password)
      email_field.scroll_to
      email_field.set user_name
      password_field.scroll_to
      password_field.set password
      signin_button.scroll_to
      signin_button.touch
    end

    def go_back_to_library
      #back_button.touch
      press_back_button
    end

    def register
      button_register.touch
    end

#    def has_invalid_username_popup?
#      wait_for_elements_exist[] # return nil(for true) or exception
#    end

#    def has_invalid_username_popup?
#      elements_exist[] #return true or false
#    end

    def has_invalid_email_address_message?
      element_exists("* id:'textview_error' text:'Invalid email address'")
    end

    def has_invalid_password_message?
      element_exists("* id:'textview_error' text:'Invalid password'")
    end

    def assert_some_popup
      #element_exists("* id:'button_register' text:'Register'")
      wait_for_elements_exist(
          [
              "* id:'button_register' text:'Register'",
              "* id:'action_bar_title' text:'Sign in'"
              #"* id:'textview_error_generic' text:'Oops! There are some things below that you need to address'"
          ],:timeout => 5)
    end

    def has_some_popup?
      #element_exists("* id:'button_register' text:'Register'")
      wait_for_elements_exist(
          [
              "* id:'button_register' text:'Register'",
              "* id:'action_bar_title' text:'Sign in'"
          #"* id:'textview_error_generic' text:'Oops! There are some things below that you need to address'"
          ],:timeout => 5)
    end

  end
end

module PageObjectModel
  def rspec_sign_in_page
    @_rspec_sign_in_page ||= page(RSpecSignInPage)
  end
end
