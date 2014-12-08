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
      wait_poll(until_exists: "* id:'sliding_tabs' android.widget.TextView {text BEGINSWITH '#{text}'} isSelected:true", timeout: 10) do
        press_back_button
        sleep 1
      end
    end
  end
end

World(PageObjectModel::NavigationActions)