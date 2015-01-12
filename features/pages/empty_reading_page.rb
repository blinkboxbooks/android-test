module PageObjectModel
  class EmptyReadingPage < PageObjectModel::Page
    trait "* id:'text1' BBBTextView {text BEGINSWITH 'Reading (0)'}"
  end
end


module PageObjectModel
  def empty_reading_page
    @_empty_reading_page ||= page(EmptyReadingPage)
  end
end
