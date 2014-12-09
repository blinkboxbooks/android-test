module PageAsserts

  def expect_toolbar_title_to_equal(toolbar_title)
    toolbar = "* id:'toolbar' android.widget.TextView"
    wait_for_elements_exist(toolbar,timeout: 5)
    title = query(toolbar,:text).first
    expect(title).to include(toolbar_title)
  end

end

module AssertSearch

  def assert_search_results(search_word)
    expect_page(search_results_page)
    expect(search_results_page.search_field.text).to eq(search_word)
  end

  def assert_author_name(author_name)
    authors = search_results_page.book_author.get_text
    expect(authors.first.downcase).to eq(author_name.downcase)
  end

  def assert_title(book_title)
    titles = search_results_page.book_title.get_text
    expect(titles.first.downcase).to eq(book_title.downcase)
  end

  def assert_unique_result
    expect(search_results_page.number_of_books).to eq(1)
  end

end

World(PageAsserts)
World(AssertSearch)