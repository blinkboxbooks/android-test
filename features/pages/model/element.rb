module PageObjectModel
  module CalabashProxy
    require 'calabash-android/operations'
    include Calabash::Android::Operations
  end
end

module PageObjectModel
  class Element
    include Logging

    attr_reader :selector

    def initialize selector
      @selector = selector
    end

    private
    def calabash_proxy
      @calabash_proxy ||= Class.new.extend(PageObjectModel::CalabashProxy)
    end

    public
    def exists?
      !calabash_proxy.query(selector).empty?
    end

    def attributes
      query = calabash_proxy.query(selector)
      raise "Unable to locate element \##{selector}" if query.empty?
      query.first
    end

    def has_attribute?(attr)
      attributes.has_key?(attr)
    end

    def click
      touch
    end

    def set(text)
      clear_text
      enter_text(text)
    end

    #@examples:
    #    my_element.touch --> calabash_proxy.touch(selector)
    #    my_field.enter_text("hello") --> calabash_proxy.enter_text(selector, "hello")
    #    my_field.text --> my_field.attributes['text']
    #    my_element.non_existing_method --> raise NoMethodError
    def method_missing(method_name, *args, &block)
      if calabash_proxy.respond_to?(method_name.to_sym)
        logger.debug %(Delegating method call \##{method_name}(#{args.join(', ')}) for selector "#{selector}" to calabash)
        calabash_proxy.send(method_name.to_sym, selector, *args, &block)
      elsif has_attribute?(method_name.to_s)
        logger.debug %(Fetching element attribute \##{method_name} for selector "#{selector}")
        attributes[method_name.to_s]
      else
        raise NoMethodError, %(undefined method '#{method_name}' for \##{self.class.inspect} with selector "#{selector}")
      end
    end

  end
end
