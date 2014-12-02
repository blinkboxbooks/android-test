Before do | scenario |
  if defined?(DeviceLogging)
    dlog_start
  end
end
After do | scenario |
  if defined?(DeviceLogging)
    dlog_stop
  end
end

=begin
Before('@record') do | scenario|
  $device_serial = ENV["ADB_DEVICE_ARG"]
  if $device_serial.nil?
    Cucumber.wants_to_quit = true
    return 1
  else
      $name = scenario.name.split.join("_")
      $pid = fork do
        exec "adb -s #{$device_serial} shell screenrecord /sdcard/#{$name}.mp4"
      end
  end
end

After('@record') do |scenario|
  begin
    Process.kill "TERM", $pid
    sleep 1
    `adb -s #{$device_serial} pull /sdcard/#{$name}.mp4 results/videos/`
    screenshot_embed(:prefix => "results/videos/", :name => "#{$name}", :label => "Screenshot for: #{$name}")
    screenshot_embed(:label => "Link to video: results/videos/#{$name}.mp4")
  rescue
    puts "Unable to stop recording or problem pulling video from device"
  end
end
=end