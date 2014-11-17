module PageObjectModel
  class ShopPage < PageObjectModel::Page

    attr_accessor :page_book_titles_sorted, :page_book_titles_reversed, :page_book_prices_sorted, :page_book_prices_reversed

    trait "* id:'toolbar' TextView text:'Shop'"

    element :toolbar_title, "* id:'toolbar' TextView"
    element :search_button, "* id:'search_button'"
    element :search_field, "* id:'search_src_text'"
    element :search_suggestions, "android.widget.ListPopupWindow$DropDownListView TextView"

    #Book specific (featured page)
    element :book_title_text, "* id:'title_text'"
    element :author_name_text, "* id:'author_name'"
    ###pop up
    element :pop_up_container, "* id:'container'"
    element :close_button, "* id:'button_close'"
    element :pop_up_book_title_text, "* id:'textview_title'"
    element :pop_up_book_author_text, "* id:'textview_author'"
    element :buy_now_button, "* id:'button_buy'"
    element :get_free_sample_button, "* id:'button_add_sample'"
    element :have_a_look_inside, "* id:'textview_open_sample'"
    ##pop up dialog
    element :read_now_button, "* id:'button2' text:'Read now'"
    element :download_button, "* id:'button1' text:'Download'"
    ##spinner
    element :sort_spinner, "android.widget.Spinner id:'spinner'"
    ##each shop details
    element :bookcover, "* id:'bookcover'"
    element :book_title, "* id:'textview_title'"
    element :book_author, "* id:'textview_author'"
    element :book_price, "* id:'textview_price'"
    element :book_buy_button, "* id:'button_buy' text:'BUY'"
    #pop-up Your new book is downloading
    #see below...

    #####
    section :shop_sliding_tabs, ShopSlidingTabsNavigationSection
    section :shop_highlights, ShopHighlightsSection

    def category_is_selected(category)
      wait_for_element_exists("* id:'sliding_tabs' TextView {text BEGINSWITH '#{category}'} isSelected:true", timeout: timeout_short)
    end

    def go_to_the_category
      shop_sliding_tabs.categories_tab.touch
    end

    def goto(tabname)
      elem = self.send "shop_sliding_tabs.#{tabname}_tab"
      goto_category(elem)
    end

    def search_suggestions_for(string)
      search_button.touch
      search_field.set string
      search_field.touch
    end

    def goto_fiction
      fiction_tab.touch
    end

    def goto_non_fiction
      non_fiction_tab.touch
    end

    def goto_categories
      categories_tab.touch
    end

    def search_results
      search_suggestions.get_text
    end

    def swipe_highlights_until(book_name)
      #by default it will go right
      shop_highlights.carousel.wait_for_element_exists(timeout: timeout_short)
      wait_poll(:until_exists => "* id:'title_text' text:'#{book_name}'", :timeout => 10) do
        pan(shop_highlights.carousel.selector, :right, from: {x: 0, y: 0}, to: {x: -30, y:0})
      end
    end

    def click_highlights_until(book_name)
      #by default it will go right
      shop_highlights.carousel.wait_for_element_exists(timeout: timeout_short)
      wait_poll(:until_exists => "* id:'title_text' text:'#{book_name}'", :timeout => 10) do
        shop_highlights.right_selection.touch
      end
    end

    def goto_category(category)
      shop_sliding_tabs.sliding_tabs.wait_for_element_exists(timeout: timeout_short)
      wait_poll(:until_exists => "* id:'sliding_tabs' TextView text:'#{category}'", :timeout => 10) do
        pan(shop_sliding_tabs.sliding_tabs.selector, :right, from: {x: 0, y: 0}, to: {x: -25, y:0})
      end
      tap_mark(category)
    end

    def assert_do_you_want_to_read_popup
      wait_for_elements_exist(
          [
              "* id:'parentPanel'",
              "* id:'textview_title' text:'Do you want to read the free sample now or download it to your device'",
              "* id:'textview_message' text:'(You will need to sign in or register to download)'",
              "* id:'button2' text:'Read now'",
              "* id:'button1' text:'Download'"
          ],:timeout => 5)
    end

    def assert_your_new_book_is_downloading_popup
      wait_for_elements_exist(
          [
              "* id:'parentPanel'",
              "* id:'textview_header' text:'Your new book is downloading'",
              "* id:'textview_body' text:'You'll find your new book in your library soon, and your receipt is on its way to your email inbox.'",
              "* id:'textview_terms' text:'View terms & conditions'",
              "* id:'button2' text:'Find more books'",
              "* id:'button1' text:'Go to my library'"
          ],:timeout => 5)
    end

    def goto_category_named(category_name)
      #"* id:'category_image' sibling android.widget.TextView id:'category_name' text:'Art & Photography'"
      #wait_poll(:until_exists => "* text:'#{category_name}'", :timeout => 10) do
      wait_poll(:until_exists => "* id:'category_image' sibling android.widget.TextView id:'category_name' text:'#{category_name}'", :timeout => 10) do
        pan("* id:'viewpager'", :up)
      end
      touch("* marked:'#{category_name}'")
      toolbar_title.wait_for_element_exists(timeout: timeout_short)
    end

    def assert_book_exists
      wait_for_elements_exist(
          [
              bookcover.selector,
              book_title.selector,
              book_author.selector,
              book_price.selector,
              book_buy_button.selector
          ],:timeout => 10)
    end

    def sort_books_by(sort_option)
      sort_spinner.wait_for_element_exists(timeout: timeout_long)
      select_item_from_spinner("* text:'#{sort_option}'")
      book_buy_button.wait_for_element_exists(timeout: timeout_long)
      sleep 1
    end

    def titles_of_books
      page_book_titles = get_text_array(book_title.selector)
      @page_book_titles_sorted = page_book_titles.sort_by(&:downcase)
      @page_book_titles_reversed = page_book_titles.sort_by(&:downcase).reverse
      page_book_titles
    end

    def prices_of_books
      page_book_prices = get_text_array(book_price.selector)
      @page_book_prices_sorted = page_book_prices.sort_by {|x| x.scan(/\d+/).map(&:to_f)}
      @page_book_prices_reversed = page_book_prices.sort_by {|x| x.scan(/\d+/).map(&:to_f)}.reverse
      page_book_prices
    end

    def get_text_array(selector)
      array = []
      20.times do
        array.push(query(selector, :text))
        pan_up
      end
      array.flatten!
      array.uniq!
      array
    end

  end
end

module PageObjectModel
  def shop_page
    @_shop_page ||= page(ShopPage)
  end
end
