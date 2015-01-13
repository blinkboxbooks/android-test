module PageObjectModel
  class ShopBookDescriptionPage < PageObjectModel::Page

    attr_accessor :book_description_book_name, :book_description_author_name

    trait "* id:'toolbar' android.widget.TextView text:'Book description'"
    element :book_cover, "* id:'bookcover'"
    element :book_title, "* id:'textview_title'"
    element :author_link, "* id:'textview_author'"
    element :published_date, "* id:'textview_published'"
    element :book_price, "* id:'textview_price_discounted'"
    element :buy_button, "* id:'button_buy' text:'Buy now'"
    element :get_free_sample_button, "* id:'button_add_sample' text:'Get free sample''"
    element :buy_button, "* id:'button_buy' text:'Buy now'"
    element :have_a_look_inside, "* id:'textview_open_sample' text:'Have a look inside'"

    ##pop up dialog
    element :read_now_button, "* id:'button2' text:'Read now'"
    element :download_button, "* id:'button1' text:'Download'"

    def assert_do_you_want_to_read_popup
      wait_for_elements_exist(
          [
              parent_panel.selector,
              "* id:'textview_title' text:'Do you want to read the free sample now or download it to your device'",
              "* id:'textview_message' text:'(You will need to sign in or register and signin to download)'",
              read_now_button.selector,
              download_button.selector
          ],:timeout => timeout_short)
    end

    def click_on_author_title_link
      author_link.touch
    end

    def click_on_have_a_look_inside_link
      have_a_look_inside.scroll_to
      have_a_look_inside.touch
    end

    def get_book_and_author_details
      @book_description_book_name = book_title.text
      @book_description_author_name = author_link.text
    end

  end
end

module PageObjectModel
  def shop_book_description_page
    @_shop_book_description_page ||= page(ShopBookDescriptionPage)
  end
end
