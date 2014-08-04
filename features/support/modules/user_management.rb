require 'blinkbox/user'
include Blinkbox
module UserManagement
  def current_user(params = {})
    @_current_user = User.new(:grant_type => "password",:username => test_data['users']['existing']['emailaddress'], 
                              :password => test_data['users']['existing']['password'])
  end
end
