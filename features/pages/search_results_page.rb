module PageObjectModel
  class SearchResultsPage < ShopPage#PageObjectModel::Page
    trait "* id:'bookcover'"
    element :search_result_heading, "* id:'toolbar' android.widget.TextView index:0"
  end
end

module PageObjectModel
  def search_results_page
    @_search_results_page ||= page(SearchResultsPage)
  end
end
