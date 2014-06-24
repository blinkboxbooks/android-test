require 'calabash-android/cucumber'
require 'yaml'
require 'require_all'
#load page rb files
require_all File.expand_path("../pages",File.dirname(__FILE__))
#load configuration files
	#Check dynamic configuration
@conf = YAML.load_file("config/project_settings")
if !@conf['test']['environment']
	puts "Could not load nor determine the test environment from project_settings"
end
