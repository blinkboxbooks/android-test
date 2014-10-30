module PageObjectModel
  class WelcomePage < PageObjectModel::Page
    trait "BBBButton marked:'Try it out'"
    element :try_it_out_button, "BBBButton marked:'Try it out'"
    element :sign_in_or_register_button, "BBBButton marked:'Sign in or register'"

    def sign_in_or_register
      sign_in_or_register_button.touch
    end

    alias :sign_in :sign_in_or_register
    alias :start_registration :sign_in_or_register

    def goto_library
      try_it_out_button.touch
    end
  end
end

module PageObjectModel
  def welcome_page
    @_welcome_page ||= page(WelcomePage)
  end
end
