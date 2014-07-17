module PageModelHelpers
  require 'calabash-android/operations'
  include Calabash::Android::Operations
  include Logging

  def class_name_to_caller_method(class_name)
    class_name.to_s.gsub(/.*::([^:]*)/, '\1').camel_case_to_snake_case
  end

  def page_class_name_to_caller_method(class_name)
    class_name_to_caller_method(class_name).sub(/_page$/, '') + '_page'
  end

  #example: HomePage --> home_page
  # def home_page
  #    @_home_page ||= HomePage.new
  # end
  def register_page_caller_method(class_name, caller_method=nil)
    caller_method ||= page_class_name_to_caller_method(class_name)
    class_eval %Q{def #{caller_method}
                    @_#{caller_method} ||= page(#{class_name})
                  end}
  end

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