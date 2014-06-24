require 'yaml'
require 'calabash-android/cucumber'
Before do
	$dunit ||= false  # have to define a variable before we can reference its value
	return $dunit if $dunit                  # bail if $dunit TRUE
	#load configuration files
	@conf = YAML.load_file("config/project_settings")
	@testdata = YAML.load_file("config/test_settings")
	$dunit = true                            # don't do it again.
end
