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
	path = @conf['remote']['endpoint_download'] 
	`wget #{path} -P #{@conf['project']['build_dir']}`
	payload = @conf['remote']['endpoint_payload']
	Dir.chdir(@conf['project']['build_dir']){
		`unzip #{payload}`
		`mv apk/*.apk .`
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
	output = `calabash-android run #{@apks[match_configuration]}`
	puts output
end
task :default do
	#ENV['configuration'] -- Could allow us to override yaml settings from CI
	Rake::Task["android_get"].invoke
	Rake::Task["android_install"].invoke
	Rake::Task["android_sign"].invoke
end	
