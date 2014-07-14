class AutomationDSL
  def initialize selector
      raise "initialize not implemented"
  end
  def click
      raise "click not implemented"
  end
  def exists?
    raise "exists? not implemented"
  end
  def set text
    raise "set not implemented"
  end
end
class CalabashMethods < AutomationDSL
  include Calabash::Android::Operations
  attr_reader :selector
  def initialize selector
    @selector = selector
  end
  def click
    touch @selector
  end
  def exists?
    !query(@selector).empty?
  end
  def set text
    enter_text @selector,text
  end
  def method_missing(method, *args, &block)
    raise "CalabashMethods - Caught missing method => #{method.to_s}"
  end
end
