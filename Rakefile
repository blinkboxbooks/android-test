require 'fileutils'
require 'yaml'
require 'open-uri'
require 'json'

@conf = YAML.load_file("config/project_settings")
desc "Get latest android APK"

def relist_directory
	@apks = Dir[@conf['build_dir'] + "/*.apk"]
	if @apks.length == 0
		puts "No APK's found in #{@conf['build_dir']} ..aborting"
		exit 1
	end
end

task :android_get do
	if File.directory?(@conf['build_dir'])
		`rm -rf #{@conf['build_dir']}`
	end
	FileUtils::mkdir @conf['build_dir']
	#Jenkins specific build code / Replace with Teamcity URL and parsing	
	result = JSON.parse(open(@conf['build_server_latest']).read)	
	if result["result"] != "SUCCESS"
		puts "Last android CI build was not successful"
		exit 1
	end	
	@build_number = result["number"]
	#Download
	path = "%s-%s-%s-%s.apk" % [@conf['apk_url'],@conf['apk_main_version'],@build_number,@conf['apk_config']]	
	puts "Getting #{path}"
	`wget #{path}`
	`mv *.apk #{@conf['build_dir']}`
	relist_directory
end
desc "builds and resigns the apk"
task :android_sign do
	`calabash-android build #{@apks[0]}`
	`calabash-android resign #{@apks[0]}`
end
desc "Installs the apk and test server"
task :android_install do
	`adb install #{@apks[0]}`
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
