module PageObjectModel
  class SignInPage < PageObjectModel::Page
    trait "TextView marked:'Sign in'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin'"

    def submit_sign_in_details(user_name, password)
      email_field.set user_name
      password_field.set password
      scroll_down
      signin_button.touch
    end
  end

  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
