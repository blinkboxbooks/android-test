module PageModelHelpers
  include Logging

  # Determine page class name based on page name
  #
  # @param [String] page_name         page name in plain text. possible page name in the step: AllInclusive, All-Inclusive, All Inclusive, AllInclusivePage, All-Inclusive Page, All Inclusive Page
  # @return an instance of particular subclass of PageObjectModel::Page   page class or raises an exception if not found. possible class name options: AllInclusive, AllInclusivePage.
  def page_model(page_name)
    page_class = page_name.to_class_name
    unless PageObjectModel.const_defined?(page_class)
      page_class << 'Page'
      unless PageObjectModel.const_defined?(page_class)
        return nil
      end
    end
    page(PageObjectModel.const_get(page_class))
  end
end

module PageObjectModel
  extend PageModelHelpers
  include PageModelHelpers
end