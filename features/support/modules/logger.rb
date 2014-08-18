require 'logger'
module Logging
  class MultiDelegator
    def initialize(*targets)
      @targets = targets
    end

    def self.delegate(*methods)
      methods.each do |m|
        define_method(m) do |*args|
          @targets.map { |t| t.send(m, *args) }
        end
      end
      self
    end

    class <<self
      alias to new
    end
  end

  class PreLog
    attr_accessor :logger
    def initialize
      @logger ||= Logger.new MultiDelegator.delegate(:write,:close).to(STDOUT)
      @logger.level = Logger::DEBUG
    end
  end
  def logger
    @logger ||= PreLog.new.logger
  end
end
