android-test
============

android native app acceptance tests

setup
=====
- Confirm location and password/username combination of debug.keystore calabash_settings
- Confirm endpoint and project configurations in project_settings

Three settings files in config/
```
calabash_settings.yml -> controls debug.keystore location
project_settings.yml -> controls the endpoint location
test_settings.yml -> controls everything else including ENVIRONMENT
```
Dynamic configuration
---------------------
Within test_settings.yml the environment will select which APK to install and use.
There must be the appropriate authentication path to match chose configuration


```yaml
test:
 timers:
  await_timeout: 15
  scroll_timeout: 5
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
      test_settings.yml
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
