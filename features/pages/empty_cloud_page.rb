module PageObjectModel
  class EmptyCloudPage < PageObjectModel::Page
    trait "BBBTextView {text BEGINSWITH 'You don'}"
  end
end

module PageObjectModel
  def empty_cloud_page
    @_empty_cloud_page ||= page(EmptyCloudPage)
  end
end
