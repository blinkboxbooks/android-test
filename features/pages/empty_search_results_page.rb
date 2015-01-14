module PageObjectModel
  class EmptySearchResultsPage < PageObjectModel::Page
    trait "* id:'textview_error' android.widget.TextView text:'Sorry, no books were found'"
  end
end

module PageObjectModel
  def empty_search_results_page
    @_empty_search_results_page ||= page(EmptySearchResultsPage)
  end
end
