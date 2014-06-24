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
usage
=====



Typical usage
```
bundle install
rake 
rake android_run
```
project structure
================

```
config/
features/
		step_definitions/
		support/
		pages/
		Rakefile #Rake -T for options
		README.md
		calabash_settings #Debug keystore
		project_settings #Artifact url, build settings
```

Rakefile -T
```
rake android_get      # Get latest android APK
rake android_install  # Installs the apk and test server
rake android_run      # Runs calabash android
rake android_sign     # builds and resigns the apk
```	
