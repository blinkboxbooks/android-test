module PageObjectModel
  class AnonymousLibraryPage < PageObjectModel::Page
    trait "BBBTextView id:'textview_title'"
    element :home_button, "* id:'togglebutton_home'"
    element :signin_button, "TextView marked:'Sign in'"
    element :shop_button, "* id:'button_shop'"
    element :your_library_label, "* marked:'Your library'"
    element :book_cover_first, "BookCover index:0"
    element :refresh_button, "* id:'button_sync'"
    element :book_cover_first, 'BookCover index:0'
    # TODO: Be aware multiple element has the same id
    element :option_button, "* id:'btn_options'"
    element :embedded_option_menu, "* id:'text1'"

    def open_first_book
      book_cover_first.touch
    end

    def goto_shop
      shop_button.touch
    end

    def open_menu
      home_button.touch
      signin_button.wait_for_element_exists(timeout: timeout_short)
    end

    def links_on_menu_drawer(links)
      links.hashes.map { | x |  Element.new("* marked:\'#{x['links']}'").exists?  }
    end

    def open_menu_and_signin
      open_menu
      signin_button.tap_when_element_exists
    end

    def open_option_button
      option_button.touch
      option_button.wait_for_element_does_not_exist(timeout: timeout_short)
      embedded_option_menu.wait_for_element_exists(timeout: timeout_short)
    end

    def option_exists?(option_name)
      option_menu_item = Element.new("* marked:'#{option_name}'")
      option_menu_item.exists?
    end

    def refresh_icon
      refresh_button.exists?
    end

    def logged_out?
      !your_library_label.exists?
    end
  end
end

module PageObjectModel
  def anonymous_library_page
    @_anonymous_library_page ||= page(AnonymousLibraryPage)
  end
end
