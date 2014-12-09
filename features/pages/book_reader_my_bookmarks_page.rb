module PageObjectModel
  class BookReaderMyBookmarksPage < PageObjectModel::Page
    trait "android.widget.TextView text:'Your bookmarks'"
    element :title, "android.widget.TextView text:'Your bookmarks'"
    element :bookmark_book_title, "* id:'textview_bookmark_title'"
    element :bookmark_book_progress_label, "* id:'textview_bookmark_progress'"
    element :delete_bookmark, "* id:'imagebutton_delete'"
    element :bookmark_book_detail, "* id:'textview_bookmark_content'"
    element :bookmark_text, "* id:'list' child LinearLayout android.widget.RelativeLayout android.widget.TextView"
    element :save_reading_position, "android.widget.TextView text:'Save your reading position?'"
    element :save_button, "android.widget.Button text:'Save'"
    section :book_reader_static_toolbar, BookReaderStaticToolbarSection

    #pop-up for delete
    element :popup_keep_bookmark_button, "* id:'button2' text:'Keep'"
    element :popup_delete_bookmark_button, "* id:'button1' text:'Delete'"

    def assert_delete_this_bookmark
      wait_for_elements_exist(
          [
              "* id:'parentPanel'",
              "* id:'textview_title' text:'Delete this bookmark?'",
              "* id:'textview_message'", #can split this into some static text file
              popup_keep_bookmark_button.selector,
              popup_delete_bookmark_button.selector
          ],:timeout => timeout_short)
    end

    def delete_first_bookmark
      delete_bookmark.touch
      assert_delete_this_bookmark
      popup_delete_bookmark_button.touch
    end

    def delete_bookmark_for_text(text)
      touch("* id:'textview_bookmark_title' text:'#{text}' parent RelativeLayout sibling android.widget.ImageButton")
      assert_delete_this_bookmark
      popup_delete_bookmark_button.touch
    end

    def has_a_bookmark?
      title.wait_for_element_exists(timeout: timeout_short)
      query("* id:'list' child android.widget.RelativeLayout android.widget.TextView").size == 3 and# , will return 3 (title, progress and content)
      query("* id:'list' child android.widget.RelativeLayout android.widget.ImageButton").size == 1 #, will return 1 (the delete icon)
    end

    def bookmark_book_progress
      bookmark_book_progress_label.text[2..-2] #remove the brackets!
    end

    def tap_on_bookmark_link
      bookmark_book_title.wait_for_element_exists(timeout: timeout_short)
      bookmark_book_title.touch
    end

    def tap_on_save_reading_position_button
      save_reading_position.wait_for_element_exists(timeout: timeout_short)
      save_button.touch
    end

  end
end

module PageObjectModel
  def book_reader_my_bookmarks_page
    @_book_reader_my_bookmarks_page ||= page(BookReaderMyBookmarksPage)
  end
end
