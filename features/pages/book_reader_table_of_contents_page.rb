module PageObjectModel
  class BookReaderTableOfContentsPage < PageObjectModel::Page
    trait "* id:'toolbar' android.widget.TextView text:'Table of contents'"
    element :cover_link, "* id:'text1' text:'Cover'"
    #element :title_page_link, "* id:'text1' text:'Title Page'"
    element :title_page_link, "android.widget.TextView text:'Title page'"
    element :title, "* id:'listview' android.widget.TextView"
    element :save_reading_position, "android.widget.TextView text:'Save your reading position?'"
    element :save_button, "android.widget.Button text:'Save'"
    section :book_reader_static_toolbar, BookReaderStaticToolbarSection

    def select_chapter_link
      title_page_link.tap_when_element_exists(timeout: timeout_short)
    end

    def tap_on_save_reading_position_button
      save_reading_position.wait_for_element_exists(timeout: timeout_short)
      save_button.touch
    end
  end
end

module PageObjectModel
  def book_reader_table_of_contents_page
    @_book_reader_table_of_contents_page ||= page(BookReaderTableOfContentsPage)
  end
end

