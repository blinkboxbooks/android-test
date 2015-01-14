module PageObjectModel
  class ShopAuthorDetailsPage < PageObjectModel::Page
    trait "* id:'toolbar' android.widget.TextView text:'About this author'"
    element :author_image, "* id:'imageview_author'"
    element :author_name, "* id:'textview_author_name'"
    element :author_description, "* id:'textview_author_biography_phone'"
    element :book_cover_first, "* id:'bookcover' index:0"
    element :see_all_books_by_this_author, "* id:'button_see_all_books' text:'See all books by this author'"

    def click_on_all_books_by_this_author
      see_all_books_by_this_author.scroll_to
      see_all_books_by_this_author.touch
    end
  end
end

module PageObjectModel
  def shop_author_details_page
    @_shop_author_details_page ||= page(ShopAuthorDetailsPage)
  end
end