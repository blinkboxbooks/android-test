module PageObjectModel
  class SignInPage < PageObjectModel::Page
    trait "TextView marked:'Sign in'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin'"
    element :back_button, "* text:'Sign in'"

    def submit_sign_in_details(user_name, password)
      email_field.scroll_to
      email_field.set user_name
      password_field.scroll_to
      password_field.set password
      signin_button.scroll_to 
      signin_button.touch
    end

    def go_back_to_library
      back_button.touch
    end
  end
end

module PageObjectModel
  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
