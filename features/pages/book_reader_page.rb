module PageObjectModel
  class BookReaderPage < PageObjectModel::Page

    attr_accessor :book_chapter, :book_progress, :book_title
    trait "* id:'webview_reader'"

    #different bookmark icons
    element :bookmark, "* id:'reader_imageview_bookmark' contentDescription:'Remove bookmark'"
    element :help_overlay, "* id:'imageview_overlay'"
    element :webview_reader, "* id:'webview_reader'"
    element :back_to_saved_position, "* id:'button_go_to_previous'"
    element :dismiss_button, "* id:'button_dismiss_go_to_previous'"

    section :reading_option_menu, BookReaderPageMenuSection
    section :reading_header_bar, BookReaderPageHeaderSection
    section :reading_footer_bar, BookReaderPageFooterSection
    section :reading_settings, BookReaderReadingSettingsSection

    ####definition pop-up
    element :definitions_popup, "* id:'layout_definition'"
    element :see_full_definition_link, "* id:'button_see_full_definition' text:'See full definition'"
    element :lookup_word, "webView css:'*' nodeName:'H3'"
    element :lookup_definition, "webView css:'*' nodeName:'P'"

    #######definition page
    element :definition_page_lookup_word, "webView css:'*' nodeName:'H3'"
    element :definition_page_lookup_definition, "webView css:'*' nodeName:'P'"


    @@forward_tapping_point = {x: 90, y: 50}
    @@backward_tapping_point = {x: 10, y: 50}
    def turn_pages(number_of_pages)
      point = number_of_pages.to_i >= 0 ? @@forward_tapping_point : @@backward_tapping_point
      (number_of_pages.to_i.abs).times { tap(point[:x], point[:y]) ; sleep 0.5 }
    end

    def has_bookmark?
      bookmark.visible?
    end

    def not_visible?
      bookmark.visible?
    end

    def invoke_definition_popup
      webview_reader.wait_for_element_exists(timeout: timeout_short)
      sleep 2
      webview_reader.long_press
      definitions_popup.wait_for_element_exists(timeout: timeout_short)
      see_full_definition_link.wait_for_element_exists(timeout: timeout_short)
    end

    def has_popup_definition?
      !lookup_word.webview_text.nil? and !lookup_definition.webview_text.nil?
    end

    def has_full_definitions?
      !definition_page_lookup_word.webview_text.nil? and !definition_page_lookup_definition.webview_text.nil?
    end

    def goto_full_definitions_page
      see_full_definition_link.touch
      see_full_definition_link.wait_for_element_does_not_exist(timeout: timeout_short)
      definition_page_lookup_word.wait_for_element_exists(timeout: timeout_short)
    end

    def has_help_overlay?
      a = help_overlay.wait_for_element_exists(timeout: timeout_long)
      if a.nil?
        true
      else
        false
      end
    end

    def add_bookmark_via_webview_reader
      close_web_reader_header_and_footer
      tap_top_right
      wait_for_bookmark_to_appear
    end

    def remove_bookmark_via_webview_reader
      close_web_reader_header_and_footer
      tap_top_right
      wait_for_bookmark_to_disappear
    end

    def add_bookmark_via_toolbar
      invoke_web_reader_header_and_footer
      reading_header_bar.add_bookmark_button.tap_when_element_exists(timeout: timeout_short)
      bookmark.wait_for_element_exists(timeout: timeout_short)
    end

    def remove_bookmark_via_toolbar
      invoke_web_reader_header_and_footer
      reading_header_bar.remove_bookmark_button.tap_when_element_exists(timeout: timeout_short)
      wait_for_bookmark_to_disappear
    end

    def wait_for_bookmark_to_disappear
      bookmark.wait_for_element_does_not_exist(timeout: timeout_short)
    end

    def wait_for_bookmark_to_appear
      bookmark.wait_for_element_exists(timeout: timeout_short)
    end

    def go_back_to_saved_reading_position
      back_to_saved_position.tap_when_element_exists(timeout: timeout_short)
    end

    def invoke_web_reader_header_and_footer
      unless reading_header_bar.button_options.exists? and reading_footer_bar.progress_bar.exists?
        wait_poll(until_exists: reading_header_bar.button_options.selector, timeout: timeout_short) do
          webview_reader.tap_when_element_exists(timeout: timeout_short)
          sleep 1
      end
    end
      #unless reading_header_bar.button_options.exists? and reading_footer_bar.progress_bar.exists?
        #webview_reader.tap_when_element_exists(timeout: timeout_short)
      #end
      wait_for_elements_exist(
          [
              reading_header_bar.header_bar.selector,
              reading_footer_bar.footer_bar.selector,
              reading_footer_bar.chapter_label.selector,
              reading_footer_bar.progress_label.selector
          ],:timeout => timeout_long)
      capture_footer_text
    end

    def get_header_and_footer_text
      invoke_web_reader_header_and_footer
      capture_footer_text
    end

    def capture_footer_text
      @book_chapter = reading_footer_bar.chapter_label.text
      book_progress_string = reading_footer_bar.progress_label.text
      @book_progress = book_progress_string.slice(0..(book_progress_string.index('%')))
    end

    def close_web_reader_header_and_footer
      if reading_header_bar.button_options.exists? and reading_footer_bar.progress_bar.exists?
        tap_middle
        sleep 2
        reading_header_bar.header_bar.wait_for_element_does_not_exist(timeout: timeout_medium)
        reading_footer_bar.footer_bar.wait_for_element_does_not_exist(timeout: timeout_medium)
      end
    end

    def choose_option_from_reading_menu(option)
      invoke_web_reader_header_and_footer
      reading_header_bar.button_options.tap_when_element_exists(timeout: timeout_short)
      tap_when_element_exists("* id:'title' text:'#{option}'")
    end

    def goto_my_bookmarks
      choose_option_from_reading_menu("My bookmarks")
    end

    def move_slider_to_position(progress, direction = :right)
      invoke_web_reader_header_and_footer
      pan("* id:'progress'", direction, from: {x: 0, y: 0}, to: {x:progress.to_i , y:0})
      sleep 1
      close_web_reader_header_and_footer
    end
  end
end

module PageObjectModel
  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
