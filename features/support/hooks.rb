require_relative 'env.rb'
include UtilityObjects

Before do | scenario |
	FileUtils::mkdir_p(conf_data['project']['log_path'])
conf_data['project']['log_pid'] = fork { `adb logcat *:#{conf_data['project']['log_level']} >> #{conf_data['project']['log_path']}/device-#{Time.now.to_i}.log` }
end
After do | scenario |
	Process.kill 9, conf_data['project']['log_pid']
end

