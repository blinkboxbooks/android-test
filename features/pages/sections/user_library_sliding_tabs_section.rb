module PageObjectModel
  class UserLibrarySlidingTabsSection < PageObjectModel::Page
    trait "* id:'sliding_tabs'"
    element :reading_tab, "TextView {text BEGINSWITH 'Reading'}"
    element :my_library_tab, "TextView {text BEGINSWITH 'My Library'}"
  end
end
