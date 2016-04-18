# Name: hooks.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This file contains the setup and teardown methods for the tests


Before do |scenario|
  ENV['TEST_URL'] = "https://104.131.191.140" if ENV['TEST_URL'].nil?
  @scenario_name=scenario.name
  @step=0
  @driver = TestNow.init
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
  unsorted_har_list=Dir['reports/upa/*+*.har']
  sorted_har_list=unsorted_har_list.sort_by!{ |m| m.downcase }
  sorted_har_list.each do |har|
    new_name = "#{@scenario_name.squeeze.gsub(" ","_")}_#{@step+=1}"
    File.rename(har,"reports/upa/#{new_name}.har")
    `simplehar reports/upa/#{new_name}.har reports/upa/#{new_name}.html`
    report_file = File.absolute_path("#{new_name}.html","reports/upa")
    doc = File.read(report_file)
    new_doc = doc.gsub("SimpleHar", "TestNow UPA Report")
    File.open(report_file, "w") {|file| file.puts new_doc }
    embed("upa/#{new_name}.html","text/html","UPA")
  end

  begin
    encoded_img = driver.screenshot_as(:base64)
    embed("#{encoded_img}", "image/png;base64")
  rescue
    p "*** Could Not take screenshot ***"
  end
end



