class CalabashMethods
  include Calabash::Android::Operations
  attr_reader :selector
  def initialize selector
    @selector = selector
  end
  def click
    puts "Touching => #{@selector}"
    touch @selector
  end
  def method_missing(method, *args, &block)
    puts "CalabashMethods - Caught missing method #{method.to_s}"
  end
end
