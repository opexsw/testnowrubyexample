# Name: hooks.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This file contains the setup and teardown methods for the tests


Before do
  case ENV['BROWSER'].downcase
    when "chrome"
      launch_driver_chrome
    when "android"
      launch_driver_android
    when "opera"
      launch_driver_opera
    when "AndroidChrome"
      launch_driver_android_chrome  
    when "ie"
      launch_driver_ie
    else
      launch_driver_firefox
  end
end

After do |scenario|
  if scenario.failed?
    begin
      encoded_img = driver.screenshot_as(:base64)
      embed("#{encoded_img}", "image/png;base64")
    rescue
      p "*** Could not take failed scenario screenshot ***"
    end
  end
  quit_driver
end

at_exit do
  ENV['TITLE'] = "MAGENTO AUTOMATION REPORT" if ENV['TITLE'].nil?
  report_file = File.absolute_path("magento_report.html","reports")
  doc = File.read(report_file)
  new_doc = doc.sub("Cucumber Features", "#{ENV['TITLE']}")
  File.open(report_file, "w") {|file| file.puts new_doc }
end

AfterStep do
  begin
    encoded_img = driver.screenshot_as(:base64)
    embed("#{encoded_img}", "image/png;base64")
  rescue
    p "*** Could Not take screenshot ***"
  end
end



