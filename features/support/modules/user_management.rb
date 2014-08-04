require 'blinkbox/user'
include Blinkbox
module UserManagement
  def current_user(params = {})
    username = params[:username] ? params[:username] : test_data['users']['existing']['emailaddress']
    password = params[:password] ? params[:password] : test_data['users']['existing']['password'] 
    @_current_user = User.new(:grant_type => "password", :username => username, 
                              :password => password)
  end
end
