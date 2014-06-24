require 'yaml'
require 'httparty'
require 'calabash-android/cucumber'
Before do
	$dunit ||= false
	return $dunit if $dunit              
	#load configuration files
	assert_not_nil($testdata,"No test data found")
	assert_not_nil($conf,"No conf data found")
	@env = $testdata['test']['environment']
	assert_not_nil(@env,"Environment data was nil")
	@auth = $testdata['environment'][@env]['url']['auth']
	assert_not_nil(@auth,"Auth data for selected env was nil")
	@host = $testdata['environment'][@env]['qa']['host']
	assert_not_nil(@host,"Host data for selected env was nil")
	$dunit = true                           

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
World(KnowAboutOauthRequests, LibraryService)
