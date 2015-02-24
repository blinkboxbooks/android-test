android-test
============

android native app acceptance tests

Please read the [Wiki](../../wiki) to get started.


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
```
bundle install
rake 
rake calabash:run
```

Custom features
```
bundle install
rake 
rake calabash:run feature=features/login.feature
```

Custom profiles
```
bundle install
rake 
rake calabash:run profile=smoke
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

Execution control variables
===========================
There're a few environment variables built into the calabash source code or introduced by us, which are used to control
 the calabash behaviour during execution. Please refer to Calabash [documentation](https://github.com/calabash/calabash-android/blob/master/ruby-gem/ENVIRONMENT_VARIABLES.md)
 
 Note: Calabash will always [re-install the app once for every feature file](https://git.mobcastdev.com/TEST/android-test/blob/master/features/support/hooks/app_installation_hooks.rb#L18) - we can change it in the app_installation_hooks.rb

- *REINSTALL_BETWEEN_SCENARIOS* (custom var) - if set to "1", Calabash will re-install the app between scenarios
- *SCREENSHOT_VIA_USB* - if set to "true", Calabash will take screenshots from a connected device via USB. Reliable option if you connect device with a cable.

Cucumber tagging convention
===========================
Please refer to common convention in [confluence](http://jira.blinkbox.local/confluence/display/TEST/Cucumber+Tags+Convention)
- *@clear_app_data* - clear_app_data before the tagged scenario
NOTE: right now we do clear_app_data before every scenario


## Copyright
2015 blinkbox books Ltd. See LICENCE for details.

## Key Contributors
* [Sher Bhachu](https://github.com/sherbhachu)
* [Alex Jones](https://github.com/AlexsJones)
* [Alex Ikhelis](https://github.com/aikhelis)
* [Ankur Gamit](https://github.com/ankurgamit)
* [Jagdeep Kalsi](https://github.com/jkalsi)
