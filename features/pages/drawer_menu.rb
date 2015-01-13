module PageObjectModel
  class DrawerMenu < PageObjectModel::Page
    trait "* id:'action_bar_title' text:'Sign in'"
    element :drawer_menu, "* id:'fragment_drawermenu'"
    element :toggle_button, "* id:'togglebutton_home'"
    element :my_device, "* id:'text1' text:'On your device'"
    element :my_cloud, "* id:'text1' text:'In your cloud'"
    element :refresh_library, "* id:'text1' text:'Refresh your library'"
    element :sign_out, "* id:'text1' text:'Sign out'"
    element :shop_for_more_books, "* id:'text1' text:'Shop for more books'"
    element :faq_option, "* id:'text1' text:'Frequently asked questions'"
    element :contact_us, "* id:'text1' text:'Contact us'"
    element :info_option, "* id:'text1' text:'Info'"

    def swipe_in_menu
      unless drawer_menu.exists?
        #toggle_button.touch
        perform_action('swipe','left')
        drawer_menu.wait_for_element_exists(timeout: timeout_short)
      end
    end

    def swipe_out_menu
      if drawer_menu.exists?
        perform_action('swipe','right')
        #toggle_button.touch
        drawer_menu.wait_for_element_does_not_exist(timeout: timeout_short)
      end
      sleep 1
    end

    def goto_library(type)
      swipe_in_menu
      if self.send("my_#{type}").enabled?
        self.send("my_#{type}").tap_when_element_exists(timeout: timeout_short)
      end
      swipe_out_menu
    end

  end
end

module PageObjectModel
  def drawer_menu_page
    @_drawer_menu_page ||= page(DrawerMenu)
  end
end
