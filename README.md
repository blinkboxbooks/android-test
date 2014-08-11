android-test
============

android native app acceptance tests


Documentation
============= 

[Wiki](https://git.mobcastdev.com/TEST/android-test/wiki)


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
rake calabash:run
#Optional: rake calabash:run feature=features/login.feature
#Optional: rake calabash:run profile=smoke   This is based on config/cucumber.yml
```
Custom usage
```shell
bundle install
rake endpoint_download=/Users/foo/Desktop/apk.zip endpoint_type=local
rake calabash:run
```

project structure
================

```shell
config/
	  test_settings.yml
	  project_settings.yml
	  test_data.yml
	  cucumber.yml
features/
		step_definitions/
		support/
				modules/
		pages/
		      model/
		Rakefile #rake -T for options
		README.md
		Gemfile
```

rake -T
```
rake android:get_latest_apk         # Get latest android APK
rake android:install_apk[apk_file]  # Installs the apk and test server (will reinstall if in...
rake android:resign[apk_file]       # builds and resigns the apk
rake calabash:environment_install   # Checks development environment and install essentials
rake calabash:run_config            # Prints out details about current configuration
rake calabash:console[apk_file]     # Run calabash-android console with included Calabash::A...
rake calabash:run[apk_file]         # Runs calabash android
```	
