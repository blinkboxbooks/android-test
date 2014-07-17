require 'require_all'
require 'rspec'
require 'calabash-android/cucumber'

require_all File.expand_path('hooks', File.dirname(__FILE__))
require_all File.expand_path('modules', File.dirname(__FILE__))

World(Logging)
World(DeviceLogging)
World(UtilityObjects)
World(KnowAboutOauthRequests)
World(LibraryService)

require_all File.expand_path('../pages/model', File.dirname(__FILE__))
require_all File.expand_path('../pages', File.dirname(__FILE__))
World(PageObjectModel)
