module PageObjectModel
  class BookReaderEmptyMyBookmarksPage < PageObjectModel::Page
    trait "* id:'empty' text:'You do not have any bookmarks.'"
    section :book_reader_static_toolbar, BookReaderStaticToolbarSection
  end
end

module PageObjectModel
  def book_reader_empty_my_bookmarks_page
    @_book_reader_empty_my_bookmarks_page ||= page(BookReaderEmptyMyBookmarksPage)
  end
end
