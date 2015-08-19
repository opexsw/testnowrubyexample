# Name: driver_config.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is config file containing methods to initialize different browsers
# to enable cross-browser testing for this application


ENV['TEST_URL'] = "https://104.131.191.140" if ENV['TEST_URL'].nil?

#Firefox browser
def launch_driver_firefox
  @driver = Selenium::WebDriver.for :firefox
  @driver.manage.timeouts.implicit_wait = 30
  #@driver.manage.timeouts.page_load = 120
  @driver.manage.window.maximize
end

#Chrome browser
def launch_driver_chrome
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.timeouts.implicit_wait = 30
  @driver.manage.timeouts.page_load = 120
  @driver.manage.window.maximize
end

#IE browser
def launch_driver_ie
  @driver = Selenium::WebDriver.for :internet_explorer
  @driver.manage.timeouts.implicit_wait = 90
  @driver.manage.timeouts.page_load = 120
  @driver.manage.window.maximize
end

#Opera browser
def launch_driver_opera
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 180 # seconds
  service = Selenium::WebDriver::Chrome::Service.new("/usr/local/bin/operadriver", 48923)
  service.start
  cap = Selenium::WebDriver::Remote::Capabilities.chrome('operaOptions' => {'binary' => '/usr/bin/opera', 'args' => ["--ignore-certificate-errors"]})
  @driver = Selenium::WebDriver.for(:remote, :url => service.uri, :desired_capabilities => cap, :http_client => client)
  @driver.manage.timeouts.implicit_wait = 60
  @driver.manage.window.maximize
  @driver.manage.timeouts.page_load = 120
end

#Android browser
def launch_driver_android
  @driver = Selenium::WebDriver.for :remote, :desired_capabilities => :android
end

def driver
  @driver
end

def quit_driver
  @driver.quit
end


