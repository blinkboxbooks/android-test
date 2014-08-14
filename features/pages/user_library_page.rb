module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "BBBTextView marked:'Your library'"
    element :shop_button, "* id:'button_shop'"
    element :book_cover_first, "BookCover index:0"
    element :signout_button, "TextView marked:'Sign out'"
    element :home_button, "* id:'togglebutton_home'"
    element :your_library_label, "* marked:'Your library'"

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

    def links_on_drawer_menu(links)
      links.hashes.map { | x |  Element.new("* marked:\'#{x['links']}'").exists?  }
    end

    def signed_in?
      your_library_label.exists?
    end

    def sign_out
      open_drawer_menu
      signout_button.touch
    end
  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
