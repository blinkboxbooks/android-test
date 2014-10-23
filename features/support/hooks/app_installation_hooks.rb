require 'calabash-android/management/app_installation'

AfterConfiguration do |_config|
  FeatureNameMemory.feature_name = nil
end

def reinstall_apk
  uninstall_apps
  install_app(ENV["TEST_APP_PATH"])
  install_app(ENV["APP_PATH"])
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end

  feature_name = scenario.feature.title
  if (FeatureNameMemory.feature_name != feature_name || ENV["REINSTALL_BETWEEN_SCENARIOS"] == "1")
    if ENV["REINSTALL_BETWEEN_SCENARIOS"] == "1"
      logger.debug "New scenario - reinstalling apps..."
      log "New scenario - reinstalling apps"
    else
      logger.debug "First scenario in feature - reinstalling apps"
      log "First scenario in feature - reinstalling apps"
    end

    reinstall_apk
    FeatureNameMemory.feature_name = feature_name
    FeatureNameMemory.invocation = 1
  else
    FeatureNameMemory.invocation += 1
  end
end

FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end
