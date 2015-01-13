require 'require_all'
require 'rspec'
require 'calabash-android/cucumber'
require 'awesome_print'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect, :should
  end
end

World(RSpec::Matchers)

require_all File.expand_path('hooks', File.dirname(__FILE__))
require_all File.expand_path('modules', File.dirname(__FILE__))

World(Logging)
World(DeviceLogging)
World(UtilityObjects)
World(KnowAboutOauthRequests)
World(LibraryService)
World(UserManagement)

require_all File.expand_path('../pages/model', File.dirname(__FILE__))
require_all File.expand_path('../pages', File.dirname(__FILE__))
require_all File.expand_path('../pages/actions', File.dirname(__FILE__))
require_all File.expand_path('../pages/asserts', File.dirname(__FILE__))

World(PageObjectModel)
World(PageObjectModel::PageActions)
World(PageObjectModel::PageAsserts)