echo "Provisioning vagrant box"

#this takes care of the proxy not resolving artifactory correctly
cd /android-test
sed 's/artifactory.blinkbox.local/192.168.16.183/g' Gemfile
#This gets around an error caused by bundler `require': no such file to load -- mkmf (LoadError)`
gem install bundler

bundle update
