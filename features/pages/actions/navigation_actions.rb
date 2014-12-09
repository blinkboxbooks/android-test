module PageObjectModel
  module NavigationActions
    require 'calabash-android/operations'

    def go_back_to_my_library_page_from_signin_page
      sign_in_page.await
      navigate_back_until_my_library_page_present
    end

    def navigate_back_until_my_library_page_present
      navigate_back_to_user_library("My Library")
    end

    def navigate_back_until_user_library_reading_page_present
      navigate_back_to_user_library("Reading")
    end

    def navigate_back_to_user_library(text)
      wait_poll(until_exists: "* id:'sliding_tabs' android.widget.TextView {text BEGINSWITH '#{text}'} isSelected:true", :retry_frequency => 5, timeout: 10) do
        up_button = "android.widget.ImageButton contentDescription:'Navigate up'"
        if element_exists(up_button)
          touch(up_button)
        else
          press_back_button
        end
      end
    end
  end
end

World(PageObjectModel::NavigationActions)