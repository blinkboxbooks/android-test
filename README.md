android-test
============

android native app acceptance tests

project structure
================

```
features/
		step_definitions/
		support/
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
