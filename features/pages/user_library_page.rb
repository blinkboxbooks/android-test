module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page

    trait "* id:'toolbar' TextView text:'blinkbox'"
    #books list
    element :book_cover_first, "* id:'bookcover' index:0"
    element :book_options_first, "* id:'btn_options' index:0"

    section :user_library_top_nav, UserLibraryTopNavSection
    section :user_library_sliding_tabs, UserLibrarySlidingTabsSection
    section :user_library_drawer_menu, UserLibraryDrawerMenuSection
    section :user_library_options_menu, UserLibraryOptionsMenuSection
    section :user_library_register, UserLibraryRegisterSection

    element :progress_bar, "* id:'progressbar_read'"

    #remove pop up
    element :ok_button, "* id:'button1' text:'OK'"
    element :cancel_button, "* id:'button2' text:'Cancel'"

    def assert_remove_read_popup
      wait_for_elements_exist(
          [
              "* id:'parentPanel'",
              "* id:'textview_title' text:'Remove'",
              "* id:'textview_message' text:'Your sample will be deleted and removed from the library'",
              cancel_button.selector,
              ok_button.selector
          ],:timeout => 5)
    end

    def open_first_book
      book_cover_first.tap_when_element_exists(timeout: timeout_short)
    end

    def open_first_book_options
      wait_poll(:until_exists => user_library_options_menu.options_menu_panel.selector, :retry_frequency => 3, :timeout => timeout_medium) do
        book_options_first.tap_when_element_exists
      end
    end

    def from_options_menu_choose(option)
      open_first_book_options
      tap_when_element_exists("* id:'title' marked:'#{option}'")
      #user_library_top_nav.shop_button.wait_for_element_does_not_exist(timeout: timeout_page_transition)
    end

    def remove_book_from_my_library
      from_options_menu_choose("Remove")
      assert_remove_read_popup
      ok_button.touch
      book_cover_first.wait_for_element_exists(timeout: timeout_short)
    end

    def goto_shop
      user_library_top_nav.shop_button.touch
    end

    def open_menu
      user_library_drawer_menu.open_menu
    end

    def signed_in?
      self.displayed?
    end

    def sign_out
      user_library_drawer_menu.sign_out
    end

    def open_option_button
      open_first_book_options
    end

    def open_menu_and_signin
      open_menu
      user_library_drawer_menu.signin_button.tap_when_element_exists(timeout: timeout_short)
    end

    def choose_about_option
      user_library_options_menu.about.touch
    end

    def goto_reading_tab
      user_library_sliding_tabs.reading_tab.touch
    end

    def goto_my_library_tab
      user_library_sliding_tabs.my_library_tab.touch
    end

    def goto_drawer_option(drawer_menu_item)
      open_menu
      tap_when_element_exists("* id:'text1' {text BEGINSWITH '#{drawer_menu_item}'}",timeout: timeout_short)
    end
  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end