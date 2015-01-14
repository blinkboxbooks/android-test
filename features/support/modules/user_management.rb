require 'blinkbox/user'

module UserManagement
  def user_interface(params = {})
    if @_user_interface.nil?
      username = params[:username] ? params[:username] : test_data['users']['existing']['emailaddress']
      password = params[:password] ? params[:password] : test_data['users']['existing']['password']
      current_env = ENV['environment']# ? ENV['environment'] : test_conf_data['environment']
      if current_env.nil?
        abort "You need to specify an environment variable! i.e. calabash-android run my_app.apk my.feature environment=dev-debug"
      end
      puts "Your chosen environment is...#{current_env}"
      @_user_interface ||= Blinkbox::User.new(:server_uri => test_conf_data['environments'][current_env]['auth_url'],
                                              :username => username, :password => password)
      @_user_interface.authenticate
    end
    @_user_interface
  end
end
