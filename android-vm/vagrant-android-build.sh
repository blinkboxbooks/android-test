apt-get install openjdk-7-jdk unzip -y
# For maven-plugin
apt-get install lib32z1-dev bison flex lib32ncurses5-dev libx11-dev gperf g++-multilib -y
# Setup Android SDK
sudo -u vagrant wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-20131030.zip
sudo -u vagrant unzip adt-bundle-linux-x86_64-20131030.zip
# Add Android SDK to PATH
sudo -u vagrant echo export PATH=/home/vagrant/adt-bundle-linux-x86_64-20131030/sdk/tools:\$PATH >> /home/vagrant/.bashrc
sudo -u vagrant echo export PATH=/home/vagrant/adt-bundle-linux-x86_64-20131030/sdk/platform-tools:\$PATH >> /home/vagrant/.bashrc
 
# Maven
sudo -u vagrant wget http://download.nextag.com/apache/maven/maven-3/3.2.1/binaries/apache-maven-3.2.1-bin.tar.gz
sudo -u vagrant tar -xvzf apache-maven-3.2.1-bin.tar.gz
# Add Maven to PATH
sudo -u vagrant echo export PATH=/home/vagrant/apache-maven-3.2.1/bin:\$PATH >> /home/vagrant/.bashrc
 
# Install API 16 (sample project needs it)
# echo "y" is a hack to accept the license
sudo -u vagrant echo "y" | /home/vagrant/adt-bundle-linux-x86_64-20131030/sdk/tools/android update sdk -t 6 --no-ui -y
# ANDROID_HOME is for Maven
sudo -u vagrant echo export ANDROID_HOME=/home/vagrant/adt-bundle-linux-x86_64-20131030/sdk/ >> /home/vagrant/.bashrc

# Install android-test
apt-get install git -y
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
rbenv install 2.0.0 -k
rbenv global 2.0.0
sudo rm -rf /usr/bin/ruby
sudo rm -rf /opt/vagrant_ruby/bin/ruby 
sudo ln -s /home/vagrant/.rbenv/shims/ruby /usr/bin/ruby
gem install bundler
