require 'pp'
require 'sys/proctable'
include Sys


module DeviceLogging
	include Logging
	class DeviceLogger
		def kill_existing_processes
			a = ProcTable.ps
			a.each do | p |
				if p.comm.include? "adb"
					if p.cmdline.include? "logcat"
						Process.kill 9, p.pid
					end
				end
			end
		end
		def start
			kill_existing_processes
			@pid = fork { `adb logcat *:I >> device-#{Time.now.to_i}.log` }
		end
		def stop
			if @pid
				Process.kill 9, @pid
			end
		end
	end
	def device_logger
		@device_logger ||=DeviceLogger.new
	end
	def dlog_start
		device_logger.start
	end
	def dlog_stop
		device_logger.stop
	end
end
