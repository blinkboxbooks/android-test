module PageObjectModel
  class ShopPageNavigation < PageObjectModel::Page
    trait "* id:'sliding_tabs'"
    element :toggle_button, "* id:'togglebutton_home'"
    element :featured_category, "* text:'Featured'"
    element :left_selection, "* id:'left_selection'"
    element :right_selection, "* id:'right_selection'"
    element :book_title_text, "* id:'title_text'"
    element :author_name_text, "* id:'author_name'"
    ###pop up
    element :close_button, "* id:'button_close'"
    element :pop_up_book_title_text, "* id:'textview_title'"
    element :pop_up_book_author_text, "* id:'textview_author'"
    element :buy_now_button, "* id:'button_buy'"
    element :get_free_sample_button, "* id:'button_add_sample'"
    element :have_a_look_inside, "* id:'textview_open_sample'"
    ##pop up dialog
    element :read_now_button, "* id:'button2' text:'Read now'"
    element :download_button, "* id:'button1' text:'Download'"

    def assert_do_you_want_to_read_popup
      wait_for_elements_exist(
          [
              "* id:'parentPanel'",
              "* id:'textview_title' text:'Do you want to read the free sample now or download it to your device'",
              "* id:'textview_message' text:'(You will need to sign in or register and signin to download)'",
              read_now_button.selector,
              download_button.selector
          ],:timeout => 5)
    end
  end
end

module PageObjectModel
  def shop_page_navigation
    @_shop_page_navigation ||= page(ShopPageNavigation)
  end
end
