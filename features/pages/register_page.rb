class RegisterPage < BBBPage

  def trait
    "* id:'action_bar_title' marked:'Register'"
  end

  def register_user(options)
    options.each do |k, v |
      performAction('enter_text_into_id_field', v, k )
    end
    performAction('toggle_numbered_checkbox', 3)
    register_button
    page(UserLibraryPage).await
  end

  def register_button
    if query("BBBButton marked:'Register'").empty?
      performAction('go_back')
    end
    touch("BBBButton marked:'Register'")
  end

  def registration_failed?(field)
    !query("* id:'layout_error_#{field}_invalid'").empty?
  end

end