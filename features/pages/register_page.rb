module PageObjectModel
  class RegisterPage < PageObjectModel::Page
    trait "* id:'toolbar' TextView text:'Register'"
    element :email_field, "* id:'editext_emailaddress'"
    element :first_name_field, "* id:'editext_firstname'"
    element :last_name_field, "* id:'editext_lastname'"
    element :clubcard_field, "* id:'editext_clubcardno'"
    element :show_password, "* id:'checkbox_showpassword'"
    element :password_field, "* id:'editext_password'"
    element :password_repeat_field, "* id:'editext_reenterpassword'"
    element :offers_checkbox, "* id:'checkbox_offers'"
    element :terms_and_conditions_checkbox, "* id:'checkbox_terms'"
    element :register_button, "BBBButton marked:'Register'"

    def fill_in_personal_details(first_name, last_name, email)
      self.email_field.set email
      self.first_name_field.set first_name
      self.last_name_field.set last_name
    end

    def fill_in_password(password)
      self.password_field.scroll_to
      self.password_field.set password
      self.password_repeat_field.scroll_to
      self.password_repeat_field.set password
    end

    def fill_in_clubcard(clubcard)
      self.clubcard_field.scroll_to
      self.clubcard_field.set clubcard
    end

    def set_terms_and_conditions(condition)
      self.terms_and_conditions_checkbox.scroll_to
      self.terms_and_conditions_checkbox.set_checkbox(condition)
    end
  end
end

module PageObjectModel
  def register_page
    @_register_page ||= page(RegisterPage)
  end
end
