module PageObjectModel
  class SearchResultsPage < ShopPage#PageObjectModel::Page
    trait "* id:'bookcover'"
  end
end

module PageObjectModel
  def search_results_page
    @_search_results_page ||= page(SearchResultsPage)
  end
end
