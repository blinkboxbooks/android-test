module PageObjectModel

  class ShopPage < PageObjectModel::Page
    trait "* id:'action_bar_title' marked:'Shop'"
    element :search_button, "* id:'search_button'"
    element :search_field, "* id:'search_src_text'"
    element :search_suggestions, "android.widget.ListPopupWindow$DropDownListView TextView"
    element :fiction_tab, "* id:'title' {text BEGINSWITH 'Fiction'}"
    element :non_fiction_tab, "* id:'title' {text BEGINSWITH 'Non-fiction'}"
    element :categories_tab, "* id:'title' {text BEGINSWITH 'Categories'}"

    def search_suggestions_for(string)
      search_button.touch
      search_field.set string
      search_field.touch
    end

    def has_search_suggestions?
      search_suggestions.exists?
    end

    def goto_fiction
      fiction_tab.touch
    end

    def goto_non_fiction
      non_fiction_tab.touch
    end

    def goto_categories
      categories_tab.touch
    end

    def search_results
      search_suggestions.get_text
    end

  end
end

module PageObjectModel
  def shop_page
    @_shop_page ||= page(ShopPage)
  end
end
