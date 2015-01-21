module PageObjectModel
  class EndOfFullBookPage < PageObjectModel::Page
    trait "* id:'action_bar_root' TextView text:'You've finished this ebook! Discover your next favourite…'"
    element :book_cover, "* id:'imageview_book_cover' index:1"
    element :view_more_ebooks_in_the_shop_button, "* id:'button_openshop'"

    def click_on_view_more_ebooks_in_the_shop_button
      view_more_ebooks_in_the_shop_button.touch
    end

    def click_on_book_cover
      book_cover.tap_when_element_exists(timeout: timeout_short)
    end
  end
end

module PageObjectModel
  def end_of_full_book_page
    @_end_of_full_book_page ||= page(EndOfFullBookPage)
  end
end
