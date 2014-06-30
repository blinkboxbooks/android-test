require_relative 'env.rb'
require_relative 'logger.rb'
include Logging
include UtilityObjects

Before do | scenario |
	logger.debug "Before scenario..."
	FileUtils::mkdir_p(conf_data['project']['log_device_path'])
	logtimestamp = Time.now.to_i
	log_path = conf_data['project']['log_device_path'] + "/device-#{logtimestamp}.log"
	conf_data['project']['log_path'] = log_path
	conf_data['project']['log_pid'] = fork { `adb logcat *:#{conf_data['project']['log_level']} >> #{log_path}` }
end
After do | scenario |
	logger.debug "After scenario..."
	logger.debug "Saving log to " + conf_data['project']['log_path']
	Process.kill 9, conf_data['project']['log_pid']
logger.debug "Produced device log" 
end
