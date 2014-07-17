require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed(:prefix => conf_data['project']['log_screenshot_folder'])
  end
  shutdown_test_server
end
