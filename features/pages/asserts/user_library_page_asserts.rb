module PageObjectModel
  module UserLibraryPageAsserts
    def assert_name_in_drawer_menu
      wait_for { expect(user_library_page.user_library_drawer_menu.signed_in_library_label.text).to include(@first_name) }
    end
  end
end

World(PageObjectModel::UserLibraryPageAsserts)
