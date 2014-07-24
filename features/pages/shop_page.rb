module PageObjectModel
  class ShopPage < PageObjectModel::Page
    trait "* id:'action_bar_title' marked:'Shop'"
    element :search_field, "* id:'search_src_text'"
    element :search_results, "*android.widget.ListPopupWindow$DropDownListView"

    element :fiction_tab, "* id:'title' {text BEGINSWITH 'Fiction'}"
    element :non_fiction_tab, "* id:'title' {text BEGINSWITH 'Non-fiction'}"
    element :categories_tab, "* id:'title' {text BEGINSWITH 'Categories'}"

    def search(string)
      search_field.set string
      search_field.touch
    end

    def goto_fiction
      fiction_tab.click
    end

    def goto_non_fiction
      non_fiction_tab.click
    end

    def goto_categories
      categories_tab.click
    end

    def has_search_results?
    	search_results.element_exists 
    end
  end

  def shop_page
    @_shop_page ||= page(ShopPage)
  end
end
