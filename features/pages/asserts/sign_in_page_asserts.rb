module PageObjectModel
  module SignInPageAsserts
    def assert_reset_password_button
      expect(sign_in_page.send_reset_link_button).to exist
    end
  end
end

World(PageObjectModel::SignInPageAsserts)
