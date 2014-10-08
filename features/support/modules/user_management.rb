require 'blinkbox/user'
include Blinkbox
module UserManagement
  def user_interface(params = {})
    if @_user_interface.nil?
      username = params[:username] ? params[:username] : test_data['users']['existing']['emailaddress']
      password = params[:password] ? params[:password] : test_data['users']['existing']['password']
      current_env = test_conf_data['environment']
      @_user_interface ||= User.new(:server_uri => test_conf_data['environments'][current_env]['auth_url'], :grant_type => "password", :username => username, 
                                    :password => password)
      @_user_interface.authenticate
    end
    @_user_interface
  end
end
