require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  scenario_tags = scenario.source_tag_names
  logger.debug "Clearing app data before scenario..."
  clear_app_data
  if scenario_tags.include?('@reinstall')
    logger.debug "Reinstalling the app before scenario..."
    reinstall_apk
  end
  start_test_server_in_background
end

After do |scenario|
  if scenario.failed?
    screenshot_embed(:prefix => conf_data['project']['log_screenshot_folder'])
    #TODO:if the tags being passed into the profile include the environment production, then implement this...
    #Cucumber.wants_to_quit = true if scenario.failed?
  end
  shutdown_test_server
end