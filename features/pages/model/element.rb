module ElementExtensions
  require 'calabash-android/abase'
  include Calabash::Android::Operations
  def ext_selector name, pattern
    method_name = "#{name.to_s}_selector"
    define_method method_name do
      return pattern
    end
  end
  def ext_exists? name,pattern
    method_name = "#{name.to_s}_exists?"
    define_method method_name do
      return !query(pattern).empty?
    end
  end
  def ext_click name,pattern
    method_name = "#{name.to_s}_click"
    define_method method_name do
      touch(pattern)
    end
  end
  def ext_enter_text name, pattern
    method_name = "#{name.to_s}_enter_text"
    define_method method_name do |text|
      performAction('enter_text_into_id_field',text,pattern)
    end
  end
  def build_extension_methods(name, arg)
    ext_selector name, arg
    ext_exists? name, arg
    ext_click name, arg
    ext_enter_text name, arg
  end
end

module Element
  include ElementExtensions
  attr_reader :mapped_items
  def add_to_mapped_items(item)
    @mapped_items ||= []
    @mapped_items << item.to_s
  end
  def build(name, pattern)
    if pattern.empty?
      raise 'No selector'
    else
      add_to_mapped_items name
      yield
    end
    build_extension_methods name,pattern
  end
  def element(element_name, pattern)
    build element_name, pattern do
      define_method element_name.to_s do |*runtime_args|
        query(pattern)
      end
    end
  end
  def custom_element(element_name,pattern,selector,custom_action)
    if pattern.empty?
      raise 'No selector'
    end
    if !custom_action.respond_to? :call
      raise 'Requires block action'
    end
    define_method "#{element_name.to_s}_#{selector}" do |*runtime_args|
      custom_action.call(*runtime_args)
    end
    build element_name, pattern do
      define_method element_name.to_s do |*runtime_args|
        query(pattern)
      end
    end
  end
end
