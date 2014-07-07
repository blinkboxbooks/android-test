Before do | scenario |
  if defined?(DeviceLogging)
    dlog_start
  end
end
After do | scenario |
  if defined?(DeviceLogging)
    dlog_stop
  end
end
