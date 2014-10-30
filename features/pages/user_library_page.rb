module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "BBBTextView id:'textview_title' marked:'Your library'"
    #header
    element :home_button, "* id:'togglebutton_home'"
    element :refresh_button, "* id:'button_sync'"
    element :shop_button, "* id:'button_shop'"
    #drawer menu
    element :menu_your_library_label, "BBBTextView marked:'text1' {text ENDSWITH 'library'}"
    element :signout_button, "TextView marked:'Sign out'"
    element :info_button, "TextView marked:'Info'"
    #books list
    element :book_cover_first, "BookCover index:0"

    def open_first_book
      book_cover_first.touch
    end

    def goto_shop
      shop_button.touch
    end

    def open_menu
      home_button.tap_when_element_exists(timeout: timeout_short)
      info_button.wait_for_element_exists(timeout: timeout_short)
    end

    def links_on_drawer_menu(links)
      links.hashes.map { |x| Element.new("* marked:\'#{x['links']}'").exists? }
    end

    def signed_in?
      self.displayed?
    end

    def sign_out
      open_menu
      signout_button.tap_when_element_exists(timeout: timeout_short)
    end
  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
