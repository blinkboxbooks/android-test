module PageObjectModel
  class BookReaderPageHeaderSection < PageObjectModel::Page
    element :header_bar, "* id:'_layout_header_bar'"
    element :back_button, "* id:'layout_back' android.widget.ImageView"
    element :button_options, "* id:'button_options'"
    element :title_label, "* id:'textview_title'"
  end
end
