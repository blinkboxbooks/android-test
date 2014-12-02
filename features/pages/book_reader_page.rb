module PageObjectModel
  class BookReaderPage < PageObjectModel::Page

    attr_accessor :book_chapter, :book_progress, :book_title
    trait "* id:'webview_reader'"

    #different bookmark icons
    element :bookmark, "* id:'imageview_bookmark' {width = 80 }"
    element :add_bookmark_icon, "* id:'imageview_bookmark' {width = 130 }"
    element :remove_bookmark_icon, "* id:'imageview_bookmark' {width = 131 }"

    element :help_overlay, "* id:'imageview_overlay'"
    element :webview_reader, "* id:'webview_reader'"

    section :reading_drawer_menu, BookReaderPageDrawerMenuSection
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

    begin
      calabash_proxy.when_element_exists(selector, timeout: 5, action: lambda {return true})
    rescue
      false
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
      invoke_web_reader_header_and_footer
      add_bookmark_icon.tap_when_element_exists(timeout: timeout_short)
      close_web_reader_header_and_footer
      bookmark.wait_for_element_exists(timeout: timeout_short)
    end

    def remove_bookmark_via_webview_reader
      invoke_web_reader_header_and_footer
      remove_bookmark_icon.tap_when_element_exists(timeout: timeout_short)
      close_web_reader_header_and_footer
      wait_for_bookmark_to_dissapear
    end

    def wait_for_bookmark_to_dissapear
      bookmark.wait_for_element_does_not_exist(timeout: timeout_short)
    end

    def add_bookmark_via_reading_drawer_menu
      goto_bookmark_this_page
    end

    def remove_bookmark_via_reading_drawer_menu
      goto_remove_bookmark
      wait_for_bookmark_to_dissapear
    end

    def invoke_web_reader_header_and_footer
      webview_reader.tap_when_element_exists(timeout: timeout_short)
      wait_for_elements_exist(
          [
              reading_header_bar.header_bar.selector,
              reading_header_bar.title_label.selector,
              reading_footer_bar.footer_bar.selector,
              reading_footer_bar.chapter_label.selector,
              reading_footer_bar.progress_label.selector
          ],:timeout => timeout_long)
      capture_header_and_footer_text
    end

    def get_header_and_footer_text
      invoke_web_reader_header_and_footer
      capture_header_and_footer_text
    end

    def capture_header_and_footer_text
      @book_title = reading_header_bar.title_label.text
      @book_chapter = reading_footer_bar.chapter_label.text
      book_progress_string = reading_footer_bar.progress_label.text
      @book_progress = book_progress_string.slice(0..(book_progress_string.index(' ')))
    end

    def close_web_reader_header_and_footer
      if reading_header_bar.button_options.exists? and reading_footer_bar.progress_bar.exists?
        webview_reader.touch
      end
      wait_for_elements_do_not_exist(
          [reading_header_bar.button_options.selector,
           reading_footer_bar.progress_bar.selector
          ],timeout: timeout_short)
    end

    def choose_option_from_reading_drawer_menu(option)
      invoke_web_reader_header_and_footer
      reading_header_bar.button_options.tap_when_element_exists(timeout: timeout_short)
      tap_when_element_exists("* marked:'#{option}'")
      reading_drawer_menu.drawer.wait_for_element_does_not_exist(timeout: timeout_short)
    end

    def close_reading_page_drawer_menu
      if reading_drawer_menu.drawer.exists?
        reading_drawer_menu.button_options.touch
      end
      reading_drawer_menu.drawer.wait_for_element_does_not_exist(timeout: timeout_short)
    end

    def goto_my_bookmarks
      choose_option_from_reading_drawer_menu("My bookmarks")
    end

    def goto_remove_bookmark
      choose_option_from_reading_drawer_menu("Remove bookmark")
    end

    def goto_bookmark_this_page
      choose_option_from_reading_drawer_menu("Bookmark this page")
    end

    def go_back_to_book_reader_page
      press_back_button unless webview_reader.exists?
    end

    def move_slider_to_position(progress)
      invoke_web_reader_header_and_footer
      pan("* id:'progress'",:right, from: {x: 0, y: 0}, to: {x:progress.to_i , y:0})
    end
  end
end

module PageObjectModel
  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
