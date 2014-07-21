module PageObjectModel
  class ShopPage < PageObjectModel::Page
    trait "* id:'action_bar_title' marked:'Shop'"
    element :search_field, "* id:'search_src_text'"
    element :search_results, "*android.widget.ListPopupWindow$DropDownListView"
    element :fiction_button, "* text:'Fiction'"
    element :non_fiction_button, "* text:'Non-fiction'"
    element :categories_button, "* text:'Categories'"

    def search(string)
      search_field.set string
      search_field.touch
    end

    def goto_fiction
      fiction_button.click
    end

    def goto_non_fiction
      non_fiction_button.click
    end

    def goto_categories
      categories_button.click
    end

    def has_search_results?
      wait_for(timeout: 5) { search_results.exists? } rescue false
    end
  end

  def shop_page
    @_shop_page ||= page(ShopPage)
  end
end
