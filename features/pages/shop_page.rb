module PageObjectModel
  class ShopPage < PageObjectModel::Page

    attr_accessor :page_book_titles_sorted, :page_book_titles_reversed, :page_book_prices_sorted, :page_book_prices_reversed, :book_label_text

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
    element :book_price_original, "* id:'textview_price_original'"
    element :book_buy_button, "* id:'button_buy' text:'BUY'"
    element :free_book_buy_button, "* id:'listview' descendant android.widget.LinearLayout descendant android.widget.TextView text:'BUY' id:'button_buy' index:4"
    element :paid_book_buy_button, "* id:'listview' descendant android.widget.LinearLayout descendant android.widget.TextView text:'BUY' id:'button_buy' index:4"
    element :book_label, "* id:'listview' descendant android.widget.LinearLayout descendant android.widget.TextView id:'textview_title' index:4"

    #generic popup/common
    element :parent_panel, "* id:'parentPanel'"
    element :cc_image_icon, "* id:'imageview_cc_image'"
    element :cc_type, "* id:'textview_cc_type'"
    element :cc_last_four_digits, "* id:'textview_cc_number'"

    #How would you like to pay popup
    element :add_new_card_button, "* id:'button_add_new_card' text:'Add a new card'"
    element :how_would_you_like_to_pay_make_selection, "android.widget.RelativeLayout"
    element :add_new_card_popup_title, "android.widget.TextView text:'How would you like to pay?'"

    #pay now popup
    element :change_card, "* id:'button_change' text:'Change'"
    element :pay_now_button, "* id:'button_pay_now' text:'Pay now'"

    #your new ebook is downloading
    element :view_terms_and_conditions, "* id:'textview_terms' text:'View terms & conditions'"
    element :find_more_books_button, "* id:'button2' text:'Find more books'"
    element :go_to_my_library_button, "* id:'button1' text:'Go to my library'"

    #please re-enter your password popup
    element :enter_password_field, "* id:'edittext_password'"
    element :i_need_a_new_password, "* id:'textview_forgotten_password' text:'I need a new password'"
    element :confirm_password, "* id:'button_sign_in' text:'Confirm password'"

    #shop sort pop-up (from action bar)
    element :sort_action, "* id:'action_sort'"
    element :sort_popup, "* id:'fragment_dialog_radio_options_title' text:'Sort by'"

    #Register and sign in pop up
    element :create_my_account, "* id:'button_register' text:'Create my account'"
    element :email_field, "* id:'edittext_email'"
    element :password_field, "* id:'edittext_password'"
    element :signin_button, "* id:'button_signin' text:'Sign in'"
    element :forgotten_password_link, "* id:'textview_forgotten_password'"

    #####
    section :shop_sliding_tabs, ShopSlidingTabsNavigationSection
    section :shop_highlights, ShopHighlightsSection

    #payment card pop up
    section :user_library_saved_card_popup, UserLibrarySavedCardPopupSection
    section :user_library_payment_confirmation_popup, UserLibraryPaymentConfirmationPopupSection
    section :new_book_downloading_popup, UserLibraryNewBookDownloadingPopupSection

    section :enter_card_details_popup, ShopEnterCardDetailsPopupSection
    section :welcome_to_blinkbox_books_popup, WelcomeToBlinkboxBooksPopupSection

    def has_pay_now_popup?
      assert_popup([
                       parent_panel.selector,
                       bookcover.selector,
                       book_title.selector,
                       book_author.selector,
                       book_price.selector,
                       book_price_original.selector,
                       "* id:'textview_clubcard_points'",
                       cc_image_icon.selector,
                       cc_type.selector,
                       cc_last_four_digits.selector,
                       change_card.selector,
                       pay_now_button.selector,
                   ])
    end

    def has_re_enter_your_password_popup?
      assert_popup([
                       parent_panel.selector,
                       "* id:'textview_title' text:'Please re-enter your password'",
                       "* id:'textview_body' text:'For security reasons, we ask that you re-enter your password every 30 minutes – but only while you have an item in your cart.'",
                       enter_password_field.selector,
                       i_need_a_new_password.selector,
                       confirm_password.selector
                   ])
    end


    def has_would_you_like_to_pay_popup?
      assert_popup([
                      "android.widget.TextView text:'How would you like to pay?'",
                      "* id:'textview_subtext' {text BEGINSWITH 'Here is the saved payment info for'}",
                      how_would_you_like_to_pay_make_selection.selector,
                      cc_image_icon.selector,
                      cc_type.selector,
                      cc_last_four_digits.selector,
                      "* id:'textview_add_new_card' {text BEGINSWITH 'Alternatively you can add a new card.'}",
                      add_new_card_button.selector
                   ])
    end

    def has_add_new_card_popup?
      assert_popup([
                    "* id:'customPanel'",
                    add_new_card_popup_title.selector,
                    add_new_card_button.selector
                   ])
    end

    def has_your_new_book_is_downloading_popup?
      assert_popup([
                       parent_panel.selector,
                       "* id:'textview_header' text:'Your new book is downloading'",
                       "* id:'textview_body' text:'You'll find your new book in your library soon, and your receipt is on its way to your email inbox.'",
                       view_terms_and_conditions.selector,
                       find_more_books_button.selector,
                       go_to_my_library_button.selector
                   ])
    end

    def has_new_book_downloading_popup?
      assert_popup([
                       new_book_downloading_popup.new_book_downloading_text.selector,
                       new_book_downloading_popup.goto_my_library_button.selector,
                       new_book_downloading_popup.find_more_books_button.selector
                   ])
    end

    def has_register_and_signin_pop_up?
      assert_popup([
                       "* id:'alert_dialog_container'",
                       "android.widget.TextView text:'Create a free blinkbox Books account'",
                       "android.widget.TextView text:'Ready to download books to this device? Simply create a free blinkbox Books account'",
                       create_my_account.selector,
                       "android.widget.TextView text:'Already using blinkbox Books? Sign in'",
                       email_field.selector,
                       password_field.selector,
                       forgotten_password_link.selector,
                       signin_button.selector
                   ])
    end

    def has_enter_your_card_details_popup?
      assert_popup([
                       "* id:'customPanel'",
                       enter_card_details_popup.card_number_field.selector,
                       enter_card_details_popup.expiry_year_field.selector,
                       enter_card_details_popup.security_code_field.selector
                   ])
    end

    def has_welcome_to_blinkbox_books_popup?
      assert_popup([
                       "* id:'content'",
                       welcome_to_blinkbox_books_popup.welcome_to_blinkbox_books_title.selector,
                       welcome_to_blinkbox_books_popup.goto_my_library_button.selector,
                       welcome_to_blinkbox_books_popup.find_more_books_button.selector
                   ])
    end

    def category_is_selected(category)
      wait_for_element_exists("* id:'sliding_tabs' android.widget.TextView {text BEGINSWITH '#{category}'} isSelected:true", timeout: timeout_short)
    end

    def go_to_the_category
      shop_sliding_tabs.categories_tab.touch
    end

    def goto(tabname)
      elem = self.send "shop_sliding_tabs.#{tabname}_tab"
      goto_category(elem)
    end

    def search_suggestions_for(string)
      if search_button.exists?
        search_button.touch
      end
      search_field.wait_for_element_exists(timeout: timeout_short)
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
      search_suggestions.wait_for_element_exists(timeout: timeout_short)
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
      wait_poll(:until_exists => "* id:'sliding_tabs' android.widget.TextView text:'#{category}'", :timeout => 10) do
        pan(shop_sliding_tabs.sliding_tabs.selector, :right, from: {x: 0, y: 0}, to: {x: -25, y:0})
      end
      tap_mark(category)
    end

    def assert_do_you_want_to_read_popup
      wait_for_elements_exist(
          [
              parent_panel.selector,
              "* id:'textview_title' text:'Do you want to read the free sample now or download it to your device'",
              "* id:'textview_message' text:'(You will need to sign in or register and signin to download)'",
              read_now_button.selector,
              download_button.selector
          ],:timeout => timeout_short)
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

    def select_free_book_for_purchase
      free_book_buy_button.wait_for_element_exists(timeout: timeout_short)
      capture_book_title
      free_book_buy_button.touch
    end

    def capture_book_title
      @book_label_text = book_label.text
    end

    def select_book_for_purchase
      paid_book_buy_button.wait_for_element_exists(timeout: timeout_short)
      capture_book_title
      paid_book_buy_button.touch
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
      sort_action.tap_when_element_exists(timeout: timeout_long)
      sort_popup.wait_for_element_exists(timeout: timeout_short)
      #sort_spinner.wait_for_element_exists(timeout: timeout_long)
      touch("* id:'list_item_radio_button' text:'#{sort_option}'")
      #sort_spinner.wait_for_element_exists(timeout: timeout_long)
      #select_item_from_spinner("* text:'#{sort_option}'")
      book_buy_button.wait_for_element_exists(timeout: timeout_long)
      sleep 1
    end

    def titles_of_books
      page_book_titles = get_text_array(book_title.selector)
      @page_book_titles_sorted = page_book_titles.sort_by(&:downcase)
      @page_book_titles_reversed = page_book_titles.sort_by(&:downcase).reverse
      page_book_titles
    end

    def prices_of_free_books
      prices_of_books(book_price.selector)
    end

    def pre_discount_price
      arr = prices_of_books(book_price_original.selector)
      arr.each { |i| i.sub!(/\s(save)\s\d*(%)/,'') }
    end

    def final_book_price
      prices_of_books(book_price.selector)
    end

    def prices_of_books(selector)
      page_book_prices = get_text_array(selector)
      @page_book_prices_sorted = page_book_prices.sort_by {|x| x.scan(/\d+\.\d{2}/).map(&:to_f)}
      @page_book_prices_reversed = page_book_prices.sort_by {|x| x.scan(/\d+\.\d{2}/).map(&:to_f)}.reverse
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

    def verify_featured_section_contains_book(featured_section)
      wait_poll(:until_exists => "* id:'textview_title' text:'#{featured_section}'", :timeout => 10) do
        pan("* id:'viewpager'", :up)
      end
      wait_poll(:until_exists => "* id:'bookcover'", :timeout => 10) do
        pan("* id:'viewpager'", :up, from: {x: 0, y: 0}, to: {x: 0, y:-25})
      end
    end

    def has_highlights_section?
      assert_section([shop_highlights.title.selector,shop_highlights.carousel.selector])
    end

    def submit_sign_in_details(user_name, password)
      email_field.scroll_to
      email_field.set user_name
      password_field.scroll_to
      password_field.set password
      signin_button.scroll_to
      signin_button.touch
    end

    def number_of_books
      query(bookcover.selector).size
    end

    def fill_in_card_details(card_number, expiry_month, expiry_year, security_code, name_on_card)
      enter_card_details_popup.card_number_field.set card_number
      enter_card_details_popup.expiry_month_field.set expiry_month
      enter_card_details_popup.expiry_year_field.set expiry_year
      enter_card_details_popup.security_code_field.set security_code
      enter_card_details_popup.name_on_card_field.set name_on_card
    end

    def fill_in_address_details(address_line_one, address_line_two, town_or_city, postcode)
      enter_card_details_popup.address_line_one_field.scroll_to
      enter_card_details_popup.address_line_one_field.set address_line_one
      enter_card_details_popup.address_line_two_field.set address_line_two
      enter_card_details_popup.town_or_city_field.scroll_to
      enter_card_details_popup.town_or_city_field.set town_or_city
      enter_card_details_popup.postcode_field.scroll_to
      enter_card_details_popup.postcode_field.set postcode
    end
  end
end

module PageObjectModel
  def shop_page
    @_shop_page ||= page(ShopPage)
  end
end
