require 'calabash-android/cucumber'
require 'yaml'
require 'httparty'
require 'pry'
require 'require_all'
require_all File.expand_path("../pages",File.dirname(__FILE__))

module UtilityObjects
	def conf_data
		@conf_data ||= YAML.load_file("config/project_settings.yml")
		return @conf_data
	end
	def test_data
		@test_data ||= YAML.load_file("config/test_settings.yml")
		return @test_data
	end
end

module KnowAboutOauthRequests
	def authenticate(opt = {})
		auth_user = Auth.new(opt)
		@access_token = auth_user.access_token
	end
	def request_headers(header = {})
		@request_headers ||= {
			"Content-type" => "application/vnd.blinkboxbooks.data.v1+json"
		}
		if @access_token
			@request_headers["Authorization"] = "Bearer #{@access_token}"
		else
			@request_headers.delete("Authorization")
		end
		@request_headers.merge!(header)
		@request_headers
	end

	class Auth
		include HTTParty
		base_uri "#{@auth}"
		def initialize( option = {} )
			@response = self.class.post('/oauth2/token', :body => option)
		end
		def access_token
			@response["access_token"]
		end

	end
end

module LibraryService
	def add_sample_book( host, body = {}, headers = {} )
		@response = HTTParty.post(host, :body => body.to_json , :headers => headers )
	end
end
World(UtilityObjects)
World(KnowAboutOauthRequests, LibraryService)
