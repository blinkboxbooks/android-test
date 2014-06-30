android-test
============

android native app acceptance tests

setup
=====
- Confirm location and password/username combination of debug.keystore calabash_settings
- Confirm endpoint and project configurations in project_settings

Four settings files in config/
```
cucumber.yml -> cucumber profiles
test_data.yml -> test data
project_settings.yml -> controls the resource location
test_settings.yml -> controls test specific settings e.g. URL endpoints
```
Dynamic configuration
---------------------
Within test_settings.yml the environment will select which APK to install and use.
There must be the appropriate authentication path to match chose configuration


```yaml
test:
 environment: "production-debug"
 
environment:
 "production-debug":
  url:
   auth: https://auth.blinkboxbooks.com
  qa:
   host: https://api.blinkboxbooks.com/service
```
usage
=====

Typical usage
```shell
bundle install
rake 
rake android_run
#Optional: rake android_run feature=features/login.feature
#Optional: rake_android_run profile=smoke   This is based on config/cucumber.yml
```
Custom usage
```shell
bundle install
rake endpoint_download=/Users/foo/Desktop/apk.zip endpoint_type=local
rake android_run
```

project structure
================

```shell
config/
	  calabash_settings.yml
	  project_settings.yml
	  test_data.yml
	  cucumber.yml
features/
		step_definitions/
		support/
				modules/
		pages/
		Rakefile #Rake -T for options
		README.md
		Gemfile
```

Rakefile -T
```
rake android_get      # Get latest android APK
rake android_install  # Installs the apk and test server
rake android_run      # Runs calabash android
rake android_sign     # builds and resigns the apk
rake android_details  # Prints out details about the current test configuration
```	
