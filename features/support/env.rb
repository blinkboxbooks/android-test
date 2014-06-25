require 'calabash-android/cucumber'
require 'pry'
require 'require_all'
require 'test/unit'

include Test::Unit::Assertions
require_all File.expand_path("../pages",File.dirname(__FILE__))
$conf = YAML.load_file("config/project_settings.yml")
assert_not_nil($conf,"Configuration was nil")
$testdata = YAML.load_file("config/test_settings.yml")
assert_not_nil($testdata,"Test data was nil")
$lookup = YAML.load_file("config/lookup_settings.yml")
assert_not_nil($lookup,"string table data was nil")

def lookup_table(area,element)
	platform = $testdata['test']['device']
	assert_not_nil(platform,"Platform could not be found in test data")
	puts "Performing lookup #{area} #{element} #{platform} => #{$lookup[area][element][platform]}"
	return $lookup[area][element][platform]
end
def phone?
	if $testdata['test']['device'] == 'phone'
		return true
	end
	return false
end
