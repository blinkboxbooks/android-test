module PageObjectModel
  class UserLibraryDrawerMenuSection < PageObjectModel::Page
    trait "* id:'fragment_drawermenu'"
    element :drawer_menu, "* id:'fragment_drawermenu'"
    #non logged in user
    element :toggle_button, "ImageButton index:0"
    element :your_library_label, "* id:'text1' text:'Your library'"
    element :register, "* id:'text1' text:'Register'"
    element :signin_button, "* id:'text1' text:'Sign in'"

    #logged in user
    element :signed_in_library_label, "android.widget.TextView id:'text1' index:0"
    element :currently_reading, "* id:'text1' {text BEGINSWITH 'Currently reading'}"
    element :my_library, "* id:'text1' {text BEGINSWITH 'My library'}"
    element :refresh_library, "* id:'text1' text:'Refresh your library'"
    element :signout_button, "* id:'text1' text:'Sign out'"

    #common
    element :shop_label, "* id:'text1' text:'Shop'"
    element :shop_for_more_books, "* id:'text1' text:'Shop for more books'"
    element :help_label, "* id:'text1' text:'Help'"
    element :faq, "* id:'text1' text:'Frequently asked questions'"
    element :contact_us, "* id:'text1' text:'Contact us'"
    element :info, "* id:'text1' text:'Info'"

    def press_info_option
      faq_option.touch
    end

    def open_menu
      toggle_button.tap_when_element_exists(timeout: timeout_short)
      info.wait_for_element_exists(timeout: timeout_short)
    end

    def sign_out
      open_menu
      signout_button.tap_when_element_exists(timeout: timeout_short)
    end

    def swipe_in_menu
      unless drawer_menu.exists?
        perform_action('swipe','left')
        drawer_menu.wait_for_element_exists(timeout: timeout_short)
      end
      sleep 1
    end

    def swipe_out_menu
      if drawer_menu.exists?
        perform_action('swipe','right')
        drawer_menu.wait_for_element_does_not_exist(timeout: timeout_short)
      end
      sleep 1
    end
  end
end
