module DeviceLogging

  class DeviceLogger
    def start
      puts "Starting device logging"
    end
    def stop
      puts "Stopping device logging"
    end
  end
  def device_logger
    @device_logger ||=DeviceLogger.new
  end
  def dlog_start
    device_logger.start
  end
  def dlog_stop
    device_logger.stop
  end
end
