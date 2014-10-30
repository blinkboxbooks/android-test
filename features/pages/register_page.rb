module PageObjectModel

  class RegisterPage < PageObjectModel::Page
    trait "* id:'action_bar_title' text:'Register'"
    element :email, "* id:'editext_emailaddress'"
    element :first_name_field, "* id:'editext_firstname'"
    element :last_name_field, "* id:'editext_lastname'"
    element :club_card_field, "* id:'editext_clubcardno'"
    element :show_password, "* id:'checkbox_showpassword'"
    element :password_field, "* id:'editext_password'"
    element :password_reenter_field, "* id:'editext_reenterpassword'"
    element :offers_checkbox, "* id:'checkbox_offers'"
    element :terms_and_conditions, "* id:'checkbox_terms'"
    element :register_button, "BBBButton marked:'Register'"
  end

  def register_new_user(email, first_name, last_name, club_card, password, password_reenter)
    register_button.touch
    email_field.set email
    first_name_field.set first_name
    last_name_field.set last_name
    club_card_field.scroll_to
    club_card_field.set club_card
    password_field.scroll_to
    password_field.set password
    password_reenter_field.set password_reenter
    register_button.touch
    sleep 10
  end

  #query("BBBCheckBox id:'checkbox_offers'",:setChecked=>true)
  #you're taken to 'Your Library' onced registered.
end

module PageObjectModel
  def register_page
    @_register_page ||= page(RegisterPage)
  end
end
