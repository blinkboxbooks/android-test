module PageObjectModel
  class EmptyReadingPage < PageObjectModel::Page
    trait "FrameLayout id:'book_frame' android.widget.TextView text:'Find more\nebooks'"
    trait "TextView {text BEGINSWITH 'Reading (0)'}"
  end
end


module PageObjectModel
  def empty_reading_page
    @_empty_reading_page ||= page(EmptyReadingPage)
  end
end
