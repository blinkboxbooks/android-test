module PageObjectModel
  class MyLibraryPage < UserLibraryPage

    trait "* id:'sliding_tabs' TextView {text BEGINSWITH 'My Library'} isSelected:true"
    element :find_more_ebooks, "FrameLayout id:'book_frame' android.widget.TextView text:'Find more\nebooks'"
    element :my_library_book_counter, "* id:'sliding_tabs' TextView {text BEGINSWITH 'My Library'}"
    element :info_panel_button, "* id:'view_information_panel_dismiss_button'"

    #Sort by popup
    element :recently_used_checkbox, "android.widget.RadioButton text:'Recently read'"
    element :title_checkbox, "android.widget.RadioButton text:'Title A-Z'"
    element :purchase_date_checkbox, "android.widget.RadioButton text:'Purchase date'"

    def goto_shop
      user_library_top_nav.shop_button.touch
    end

    def current_number_of_books_in_my_library
      x = my_library_book_counter.text
      x.scan(/\d+/).first.to_i
    end

    def dismiss_info_panel
      if info_panel_button.element_exists
        info_panel_button.touch
        info_panel_button.wait_for_elements_do_not_exist(timeout: timeout_short)
      end
    end

  end
end

module PageObjectModel
  def my_library_page
    @_my_library_page ||= page(MyLibraryPage)
  end
end
