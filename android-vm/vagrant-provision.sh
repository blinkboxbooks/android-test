echo "Provisioning vagrant box"

#this takes care of the proxy not resolving artifactory correctly
cd /android-test
sed 's/artifactory.blinkbox.local/192.168.16.183/g' Gemfile
sed 's/mobile-build.mobcastdev.local/192.168.100.14/g' config/project_settings.yml
#This gets around an error caused by bundler `require': no such file to load -- mkmf (LoadError)`
sudo apt-get install ruby1.8-dev -y
sudo apt-get install build-essential -y
gem install bundler

bundle update
