module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "BBBTextView marked:'Your library'"
    element :shop_button, "* id:'button_shop'"
    element :book_cover_first, "BookCover index:0"

    def open_first_book
      book_cover_first.click
    end

    def goto_shop
      shop_button.click
    end
  end

  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
