require 'fileutils'
require 'yaml'
require 'open-uri'
require 'json'

@conf = YAML.load_file("config/project_settings")
desc "Get latest android APK"

def relist_directory
	@apks = Dir[@conf['project']['build_dir'] + "/*.apk"]
	if @apks.length == 0
		puts "No APK's found in #{@conf['project']['build_dir']} ..aborting"
		exit 1
	end
end

def retrieve_build_number
	#Build system specific
	result = JSON.parse(open(@conf['remote']['endpoint_latest']).read)	
	if result.length == 0
		puts "Failed to retrieve build information"
		exit 1
	end	
	return result['number']
end
def generate_directories
	if File.directory?(@conf['project']['build_dir'])
		`rm -rf #{@conf['project']['build_dir']}`
	end
	FileUtils::mkdir @conf['project']['build_dir']
end
task :android_get do
	#Prepare
	generate_directories
	#Retrieve
	@build_number = retrieve_build_number
	puts "Latest build number is " + @build_number.to_s
	#Download
	path = @conf['remote']['endpoint_download_constructor']
	path.sub! 'GREATER_VERSION', @conf['app']['greater_version']
	path.sub! 'MINOR_VERSION',@build_number.to_s
	path.sub! 'CONFIGURATION',@conf['app']['configuration']
	puts "Attempting to download #{path}"
	`wget #{path} -P #{@conf['project']['build_dir']}`
	relist_directory
end
desc "builds and resigns the apk"
task :android_sign do
	`calabash-android build #{@apks[0]}`
	`calabash-android resign #{@apks[0]}`
end
desc "Installs the apk and test server (will reinstall if installed)"
task :android_install do
	`adb install -r #{@apks[0]}`
end
desc "Runs calabash android"
task :android_run do
	relist_directory
	output = `calabash-android run #{@apks[0]}`
	puts output
end
task :default do
	Rake::Task["android_get"].invoke
	Rake::Task["android_sign"].invoke
	Rake::Task["android_install"].invoke
end	
