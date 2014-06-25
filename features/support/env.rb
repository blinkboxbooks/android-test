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
	puts "Performing lookup #{area} #{element} => #{$lookup[area][element]}"
	return $lookup[area][element]
end
def phone?
	if $testdata['test']['device'] == 'phone'
		return true
	end
	return false
end
