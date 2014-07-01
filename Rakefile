require 'fileutils'
require 'yaml'
require 'open-uri'
require 'json'
@conf = YAML.load_file("config/project_settings.yml")
@testdata = YAML.load_file("config/test_settings.yml")
@environment = @testdata['test']['environment']

desc "Get latest android APK"
def relist_directory
	@apks = Dir[@conf['project']['build_dir'] + "/*.apk"]
	if @apks.length == 0
		puts "No APK's found in #{@conf['project']['build_dir']} ..aborting"
		exit 1
	end
end
def match_configuration
	pos =0
	@apks.each do | apk |
		if apk.include? @environment
			return pos
		end
	pos +=1
	end	
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
	Dir.chdir(@conf['project']['build_dir']){
		`unzip #{payload} 2>/dev/null`
		`mv apk/*.apk . 2>/dev/null`
	}
end
task :android_get do
	generate_directories
	download_apk
	relist_directory
	puts @apks[match_configuration]
end
desc "builds and resigns the apk"
task :android_sign do
	if File.directory?('test_servers')
		`rm -rf test_servers`
	end
	`calabash-android resign #{@apks[match_configuration]}`
end
desc "Installs the apk and test server (will reinstall if installed)"
task :android_install do
	`adb install -r #{@apks[match_configuration]}`
end
desc "Runs calabash android"
task :android_run do
	relist_directory

	formatter = ENV['formatter'] ? ENV['formatter'] : "LoggedFormatter"
	output_path = ENV['output'] ? ENV['output'] : ""
	puts "Using formatter #{formatter}"
	if ENV["feature"]
		puts "Running - #{ENV["feature"]}"
		output = `calabash-android run #{@apks[match_configuration]} #{ENV["feature"]} -f #{formatter} -o #{output_path}`
	elsif ENV["profile"]
		output = `calabash-android run #{@apks[match_configuration]} --profile=#{ENV['profile']} -f #{formatter} -o #{output_path}`
	else
		output = `calabash-android run #{@apks[match_configuration]}`
	end
	puts output
end
desc "Prints out details about current configuration"
task :android_details do
	puts "Tests are currently to run on #{@testdata['test']['device']} under #{@testdata['test']['environment']} configuration"
end
desc "Checks development environment and install essentials"
task :environment_install do
	ret = `which brew`
	if ret.empty?
		`ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"`
		`brew install wget`
		`bundle install`
	end
end
task :default do
	#endpoint_download=custom endpoint
	#endpoint_payload=customise what is being downloaded e.g. 'apk.zip', 'apk.tar.gz'
	#configuration=custom configuration
	Rake::Task["android_get"].invoke
	Rake::Task["android_install"].invoke
	Rake::Task["android_sign"].invoke
end	
