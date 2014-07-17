module PageObjectModel
  require 'calabash-android/abase'

  class Page < Calabash::ABase
    include PageOperations

    def initialize(world, transition_duration=0.5)
      logger.debug "Initializing page => #{self.class.to_s}"
      super(world, transition_duration)
    end

    def self.trait selector
      class_eval %Q{
			  def trait
				  "#{selector}"
			  end
		  }
    end

    def self.element identity, selector
      class_eval %Q{
			  def #{identity}
				  @_#{identity} ||= Element.new("#{selector}")
			  end
		  }
    end

    alias :displayed? :current_page?

    #TODO: embed screenshots into our formatters
    def embed(file, mime_type, label = 'Screenshot')
      logger.info "Screenshot at #{file}"
    end

    #override default delegation to the World methods as defined in Calabash::ABase, to avoid explosion of methods
    #in the page models
    def method_missing(method_name, *args, &block)
      raise NoMethodError, "undefined method '#{method_name}' for \##{self.class.inspect}"
    end
  end

end

