module PageObjectModel
  class RegisterPage < PageObjectModel::Page
    trait "* id:'toolbar' TextView text:'Registration'"
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
    element :sign_in_with_this_email_button, "* id:'signin_with_this_email_button'"

    def fill_in_personal_details(first_name, last_name, email)
      self.email_field.set email
      self.first_name_field.set first_name
      self.last_name_field.scroll_to
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

    def enter_not_matching_password
      password_field.set test_data['passwords']['valid_password']
      password_repeat_field.set test_data['passwords']['not_matching_password']
    end

    def click_on_sign_in_with_this_email_button
      sign_in_with_this_email_button.touch
    end

    def show_oops_signin_message
      expect_text(test_data['errors']['oops_signin'])
    end

    def has_accept_terms_and_condition_message?
      show_oops_signin_message
      self.terms_and_conditions_checkbox.scroll_to
      expect_text(test_data['errors']['accept_term_and_condition'])
    end

    def has_password_dont_match_message?
      show_oops_signin_message
      self.password_repeat_field.scroll_to
      expect_text(test_data['errors']['password_dont_match'])
    end

    def has_password_invalid_message?
      show_oops_signin_message
      self.show_password.scroll_to
      expect_text(test_data['errors']['invalid_password'])
    end

    def has_email_already_registered_message?
      expect_text(test_data['errors']['already_registered'])
    end

    def has_invalid_clubcard_message?
      show_oops_signin_message
      self.clubcard_field.scroll_to
      expect_text(test_data['errors']['invalid_clubcard'])
    end

  end
end

module PageObjectModel
  def register_page
    @_register_page ||= page(RegisterPage)
  end
end
