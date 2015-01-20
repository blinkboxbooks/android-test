module PageObjectModel
  class EndOfFullBookPage < PageObjectModel::Page
    trait "* id:'content' TextView text:'You've finished this ebook! Discover your next favourite…'"
    element :book_cover, "* id:'bookcover' index:1"
    element :view_more_ebooks_in_the_shop_button, "* id:'button_openshop'"

    def click_on_view_more_ebooks_in_the_shop_button
      view_more_ebooks_in_the_shop_button.touch
    end

    def click_on_book_cover
      book_cover.touch
    end
  end
end

module PageObjectModel
  def end_of_full_book_page
    @_end_of_full_book_page ||= page(EndOfFullBookPage)
  end
end
