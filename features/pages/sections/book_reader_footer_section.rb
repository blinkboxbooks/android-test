module PageObjectModel
  class BookReaderPageFooterSection < PageObjectModel::Page
    element :footer_bar, "* id:'layout_reader_footer'"
    element :chapter_label, "* id:'textview_chapter'"
    element :progress_label, "* id:'textview_progress'"
    element :progress_bar, "* id:'progress'"
  end
end
