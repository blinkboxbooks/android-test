module PageObjectModel
  class UserLibraryOptionsMenuSection < PageObjectModel::Page
    trait "android.widget.FrameLayout android.widget.ListView"
    element :options_menu_panel, "android.widget.ListView"
    element :about, "* id:'title' text:'About'"
    element :contents, "* id:'title' text:'Contents'"
    element :read, "* id:'title' text:'Read'"
    element :remove, "* id:'title' text:'Remove'"
    element :buy_full_ebook, "* id:'title' text:'Buy full ebook'"
    element :download, "* id:'title' text:'Download'"
    element :read_later, "* id:'title' text:'Read later'"
  end
end
