module PageObjectModel
  class EndOfBookPage < PageObjectModel::Page
    trait "* id:'scrollview' TextView text:'More books we think you'll like'"
    element :buy_button, "* id:'button_buy_the_book_now'"
    element :shop_for_more_books, "* id:'button_shop_more_books'"
    element :remove_this_sample_button, "* id:'button_remove_sample'"
    element :go_to_library_button, "android.widget.Button text:'Go to your library'"
    element :book_cover, "* id:'bookcover' index:1"
    element :view_more_books_in_the_shop, "* id:'button_openshop'"
    element :book_title_name, "* id:'textview_book_title'"
    element :book_author_name, "* id:'textview_book_author'"

    #Delete sample book pop up
    element :cancel_button, "* id:'button2' text:'Cancel'"
    element :ok_button, "* id:'button1' text:'OK'"


    def has_delete_sample_pop_up?
      assert_popup([
                      "* id:'parentPanel'",
                      "* id:'textview_title' text:'Delete'",
                      "* id:'textview_message' text:'Are you sure you want to delete this sample?'",
                      cancel_button.selector,
                      ok_button.selector
                   ])
    end

    def click_on_buy_button
      buy_button.scroll_to
      buy_button.touch
    end

    def click_on_shop_for_more_books_button
      shop_for_more_books.scroll_to
      shop_for_more_books.touch
    end

    def click_on_remove_this_sample_button
      remove_this_sample_button.scroll_to
      remove_this_sample_button.touch
    end

    def click_on_go_to_library_button
      go_to_library_button.scroll_to
      go_to_library_button.touch
    end

    def click_on_more_books_you_like_book_cover
      book_cover.scroll_to
      book_cover.touch
    end

    def click_on_view_more_books_in_the_shop
      view_more_books_in_the_shop.scroll_to
      view_more_books_in_the_shop.touch
    end

    def click_ok_button_to_remove_book
      has_delete_sample_pop_up
      ok_button.touch
    end

    def click_to_cancel_removing_book
      has_delete_sample_pop_up
      cancel_button.touch
    end

    def remove_sample
      click_on_remove_this_sample_button
      click_ok_button_to_remove_book
    end

  end
end

module PageObjectModel
  def end_of_book_page
    @_end_of_book_page ||= page(EndOfBookPage)
  end
end
