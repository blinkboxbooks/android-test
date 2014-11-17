module PageObjectModel
  class ShopSlidingTabsNavigationSection < PageObjectModel::Page
  trait "* id:'sliding_tabs'"
  element :sliding_tabs, "* id:'sliding_tabs'"
  element :fiction_tab, "* id:'title' {text BEGINSWITH 'Fiction'}"
  element :non_fiction_tab, "* id:'title' {text BEGINSWITH 'Non-fiction'}"
  element :categories_tab, "* {text BEGINSWITH 'Categories'}"
  element :featured_tab, "* id:'title' {text BEGINSWITH 'Featured'}"
  element :free_tab, "* id:'title' {text BEGINSWITH 'Free'}"
  element :new_releases_tab, "* id:'title' {text BEGINSWITH 'New'}"
  end
end
