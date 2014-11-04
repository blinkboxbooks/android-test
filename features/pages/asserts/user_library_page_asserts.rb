module PageObjectModel
  module UserLibraryPageAsserts
    def assert_name_in_drawer_menu
      expect(user_library_page.menu_your_library_label.text).to match(@first_name)
    end
  end
end

World(PageObjectModel::UserLibraryPageAsserts)