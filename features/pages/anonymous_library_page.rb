module PageObjectModel
  class AnonymousLibraryPage < PageObjectModel::Page
    trait "BBBTextView id:'textview_title'"
    element :home_button, "* id:'togglebutton_home'"
    element :signin_button, "TextView marked:'Sign in'"
    element :shop_button, "* id:'button_shop'"
    element :your_library_label, "* marked:'Your library'"
    element :book_cover_first, "BookCover index:0"

    def open_first_book
      book_cover_first.touch
    end

    def goto_shop
      shop_button.touch
    end

    def open_menu
      home_button.touch
      signin_button.wait_for_element_exists(timeout: 10)
    end

    def open_menu_and_signin
      open_menu
      signin_button.tap_when_element_exists
    end

    def logged_out?
      !your_library_label.exists?
    end
  end

  def anonymous_library_page
    @_anonymous_library_page ||= page(AnonymousLibraryPage)
  end
end
