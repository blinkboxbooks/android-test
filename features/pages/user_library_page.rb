module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "BBBTextView marked:'Your library'"
    element :shop_button, "* id:'button_shop'"
    element :book_cover_first, "BookCover index:0"
    element :signout_button, "TextView marked:'Sign out'"
    element :home_button, "* id:'togglebutton_home'"

    def open_first_book
      book_cover_first.touch
    end

    def goto_shop
      shop_button.touch
    end

    def open_drawer_menu
      home_button.touch
      signout_button.wait_for_element_exists(timeout: 5)
    end

    def open_drawer_menu_and_signout
      open_drawer_menu
      signout_button.touch
    end
  end

  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
