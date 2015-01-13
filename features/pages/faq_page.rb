module PageObjectModel
  class FAQPage < PageObjectModel::Page
    trait "* id:'toolbar' android.widget.TextView text:'FAQ'"
  end
end

module PageObjectModel
  def faq_page
    @_faq_page ||= page(FAQPage)
  end
end
