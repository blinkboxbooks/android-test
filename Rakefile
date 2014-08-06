require 'fileutils'
require 'yaml'
require 'open-uri'
require 'json'
@conf = YAML.load_file("config/project_settings.yml")
@testdata = YAML.load_file("config/test_settings.yml")
@environment = @testdata['test']['environment']

# rake helper functions for android tasks
namespace :android do
  def apks
    @apks ||= Dir[@conf['project']['build_dir'] + "/*.apk"]
    if @apks.empty?
      puts "ERROR: No APK's found in #{@conf['project']['build_dir']} ..aborting"
      exit 1
    end
    @apks
  end

  def default_apk
    @default_apk ||= apks.find { |apk_name| apk_name.include? @environment }
  end

  def generate_directories
    if File.directory?(@conf['project']['build_dir'])
      `rm -rf #{@conf['project']['build_dir']}`
    end
    FileUtils::mkdir @conf['project']['build_dir']
  end

  def download_apk
    operation_type = 'wget'
    if ENV['endpoint_type'] == 'local'
      operation_type = 'cp -rf'
    end
    if ENV['endpoint_download']
      path = ENV['endpoint_download']
    else
      path = @conf['remote']['endpoint_download']
    end
    puts "Operation type #{operation_type} on path #{path}"
    `#{operation_type} #{path} -P #{@conf['project']['build_dir']} 2>/dev/null`
    if ENV['endpoint_payload']
      payload = ENV['endpoint_payload']
    else
      payload = @conf['remote']['endpoint_payload']
    end
    Dir.chdir(@conf['project']['build_dir']) {
      `unzip #{payload} 2>/dev/null`
      `mv apk/*.apk . 2>/dev/null`
    }
  end

  def resign_apk(apk_file)
    if File.directory?('test_servers')
      `rm -rf test_servers`
    end
    `calabash-android resign #{apk_file}`
  end
end


#android rake tasks
namespace :android do
  desc "Get latest android APK"
  task :get_latest_apk do
    generate_directories
    download_apk
    puts default_apk
  end

  desc "builds and resigns the apk"
  task :resign, [:apk_file] do |t, args|
    apk_file = args[:apk_file] || default_apk
    resign_apk(apk_file)
  end

  desc "Installs the apk and test server (will reinstall if installed)"
  task :install_apk, [:apk_file] do |t, args|
    apk_file = args[:apk_file] || default_apk
    `adb install -r #{apk_file}`
  end
end

#calabash rake tasks
namespace :calabash do
  desc "Prints out details about current configuration"
  task :run_config do
    puts "Tests are currently to run on #{@testdata['test']['device']} under #{@testdata['test']['environment']} configuration"
  end

  desc "Checks development environment and install essentials"
  task :environment_install do
    ret = `which brew`
    if ret.empty?
      puts "Please run : ruby -e \"$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)\""
      puts "Additional : brew install wget"
    end
  end

  desc 'Run calabash-android console with included Calabash::Android::Operations, as well as android-test support modules & page models'
  task :console, [:apk_file] do |t, args|
    apk_file = args[:apk_file] || default_apk
    ENV['IRBRC'] = File.join(File.dirname(__FILE__), 'irbrc')
    puts "REMEMBER: to run 'rake android:resign[#{apk_file}]', if you have issues running this APK"
    system "calabash-android console #{apk_file}"
  end

  desc "Runs calabash android"
  task :run, [:apk_file] do |t, args|
    apk_file = args[:apk_file] || default_apk
    puts "REMEMBER: to run 'rake android:resign[#{apk_file}]', if you have issues running this APK"
    formatter = ENV['formatter'] ? ENV['formatter'] : "LoggedFormatter"
    output_path = ENV['output'] ? ENV['output'] : ""
    puts "Using formatter #{formatter}"

    if ENV["feature"]
      puts "RUNNING: feature=#{ENV["feature"]}"
      output = `calabash-android run #{apk_file} #{ENV["feature"]} -f #{formatter} -o #{output_path} -f pretty`
    elsif ENV["profile"]
      output = `calabash-android run #{apk_file} --profile=#{ENV['profile']} -f #{formatter} -o #{output_path}`
    else
      output = `calabash-android run #{apk_file}`
    end
    puts output
  end
end


task :default do
  #endpoint_download=custom endpoint
  #endpoint_payload=customise what is being downloaded e.g. 'apk.zip', 'apk.tar.gz'
  #configuration=custom configuration
  Rake::Task["android:get_latest_apk"].invoke
  Rake::Task["android:resign"].invoke
  Rake::Task["android:install_apk"].invoke
end
