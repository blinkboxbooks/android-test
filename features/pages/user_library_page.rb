class UserLibraryPage < BBBPage

  def trait
    "BBBTextView marked:'Your library'"
  end

  def open_book(book_index = 1)
    begin
      refresh_button(false)
      refresh_button(true)
    rescue
    end
    if !query("* contentDescription:'BookCover: embedded' index:0").empty?
      touch("* contentDescription:'BookCover: embedded' index:0")
    else
      scroll_down("* contentDescription:'Expand button' index:#{book_index}")
      open_folder(true)
      scroll_down("* contentDescription:'BookCover: embedded'")
      touch("* contentDescription:'BookCover: embedded' index:0")
    end
    page(BookReaderPage).await
  end

  def has_user_logged_in?
    wait_element_to_exist(trait)
    touch("* id:'togglebutton_home'")
    logged_in = element_exists("* marked:'Sign out'")
    touch("* id:'togglebutton_home'")
    return logged_in
  end

  def sign_out
    wait_for_elements_exist(["BBBTextView"], :timeout => TEST_CONFIG["sync_timeout"])
    performAction('click_on_text', "Sign out")
  end

  def in_device_view?(boolean)
    query("* marked:'On your device'")[0]["enabled"] == boolean
  end

  def in_cloud_view?(boolean)
    query("* marked:'In your cloud'")[0]["enabled"] == boolean
  end

  def change_view(mode)
    touch("* marked:'Menu'")
    touch("TextView marked:#{mode}")
  end

  def embedded_books
    query("* contentDescription:'BookCover: embedded'")
  end

  def in_grid_view?(mode)
    query("* marked:'#{mode} view'")
  end

  def in_list_view?(mode)
    query("* marked:'#{mode} view'")
  end

  def has_list_books?
    !query("BBBTextView id:'textview_author'").empty?
  end

  def about_this_book(text)
    touch("* marked:'#{text}'")
    page(AboutThisBookPage).await
  end

  def has_drawer_button?
    has_element_with_id?("togglebutton_home")
  end
  
  def open_drawer
    wait_element_to_exist(trait)
    touch("* marked:'Menu'")
  end

  def has_drawer_open?
    has_element_with_id?("listview")
  end

  def close_drawer
    open_drawer
  end

  def open_folder(state)
    if state
      click_on_element_with_desc("Expand button", "ImageButton", 1)
    else
      click_on_element_with_desc("Collapse button", "ImageButton", 1)
    end
  end

  def refresh_button(opt)
    wait_for(:timeout => 3 ) do
      query("* id:'button_refresh', 'checked'")[0]['enabled'] == opt
    end
  end

end