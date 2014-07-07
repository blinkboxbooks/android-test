module DeviceLogging

  class DeviceLogger
    def start
    #  FileUtils::mkdir_p(conf_data['project']['log_device_path'])
      @pid = fork { `adb logcat *:I >> device-#{Time.now.to_i}.log` }
    end
    def stop
      Process.kill 9, @pid

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
