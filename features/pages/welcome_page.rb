module PageObjectModel
  class WelcomePage < PageObjectModel::Page
    trait "BBBButton marked:'Try it out'"
    element :try_it_out_button, "BBBButton marked:'Try it out'"

    def goto_library
      try_it_out_button.touch
    end
  end

  def welcome_page
    @_welcome_page ||= page(WelcomePage)
  end
end
