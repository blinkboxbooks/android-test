module PageObjectModel
  require 'calabash-android/abase'
  require_relative '../../../features/pages/actions/common_actions'

  class Page < Calabash::ABase
    include PageOperations
    include UtilityObjects
    include PageObjectModel::PageActions

    def initialize(world, transition_duration = 0.5)
      logger.debug "Initializing page => #{self.class}"
      super(world, transition_duration)
    end

    def self.trait(selector)
      class_eval %Q{
        def trait
          "#{selector}"
        end
      }
    end

    def self.element(identity, selector)
      class_eval %Q{
        def #{identity}
          @_#{identity} ||= Element.new("#{selector}")
        end
      }
    end

    def self.section(identity, classname)
      class_eval %Q{
       def #{identity}
         @_#{identity} ||= page(#{classname})
       end
     }
    end

    def timeout_short
      5
    end

    def timeout_medium
      timeout_page_transition
    end

    def timeout_page_transition
      10
    end

    def timeout_long
      Calabash::Android::WaitHelpers.const_get(:DEFAULT_OPTS)[:timeout]
    end

    alias_method :displayed?, :current_page?

    #TODO: embed screenshots into our formatters
    def embed(file, _mime_type, _label = 'Screenshot')
      logger.info "Screenshot at #{file}"
    end

    #override default delegation to the World methods as defined in Calabash::ABase, to avoid explosion of methods
    #in the page models
    def method_missing(method_name, *_args, &_block)
      raise NoMethodError, "undefined method '#{method_name}' for \##{self.class.inspect}"
    end
  end
end
