# Name: driver_config.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is config file containing methods to initialize different browsers
# to enable cross-browser testing for this application


ENV['TEST_URL'] = "https://104.131.191.140" if ENV['TEST_URL'].nil?

#Firefox browser
def launch_driver_firefox
  #puts "Launching driver for firefox.........................."
  ENV['IS_UPA'] = "false" if ENV['IS_UPA'].nil?
  if ENV['IS_UPA']=="true"
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.add_extension("./data/har/firebug-2.0.13.xpi")
    profile.add_extension("./data/har/netExport-0.8.xpi")
    profile['extensions.firebug.allPagesActivation'] = "on"
    profile['extensions.firebug.defaultPanelName'] = "net"
    profile['extensions.firebug.net.enableSites'] = "true"
    profile['extensions.firebug.showFirstRunPage'] = "false"
    profile['extensions.firebug.netexport.alwaysEnableAutoExport'] = "true"
    profile['extensions.firebug.netexport.showPreview'] = "false"
    profile['extensions.firebug.netexport.defaultLogDir'] = File.absolute_path("./reports/upa")
    profile['extensions.firebug.netexport.defaultFileName'] = "upaReport.har"
    profile['extensions.firebug.netexport.jsonpCallback'] = "jsonCallback";
    @driver = Selenium::WebDriver.for :firefox, :profile => profile
  else
    @driver = Selenium::WebDriver.for :firefox
  end
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
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120
  caps = Selenium::WebDriver::Remote::Capabilities.ie('ie.ensureCleanSession' => true, :javascript_enabled => true, :http_client => client,  :native_events => false, :acceptSslCerts => true)
  @driver = Selenium::WebDriver.for(:ie, :desired_capabilities => caps)
  @driver.manage.timeouts.implicit_wait = 90
  @driver.manage.timeouts.page_load = 120
  if ENV['RESOLUTION'].nil?
    @driver.manage.window.size = Selenium::WebDriver::Dimension.new(1366,768)
  elsif ENV['RESOLUTION'].downcase == "max"
    @driver.manage.window.maximize
  else
    res = ENV['RESOLUTION'].split('x')
    @driver.manage.window.size = Selenium::WebDriver::Dimension.new(res.first.to_i, res.last.to_i)
  end
end

#Opera browser
def launch_driver_opera
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 180 # seconds
  service = Selenium::WebDriver::Chrome::Service.new("/usr/local/bin/operadriver", 48923)
  service.start
  cap = Selenium::WebDriver::Remote::Capabilities.chrome('operaOptions' => {'binary' => '/usr/bin/opera', 'args' => ["--ignore-certificate-errors"]})
  @driver = Selenium::WebDriver.for(:remote, :url => service.uri, :desired_capabilities => cap, :http_client => client)
  @driver.manage.timeouts.implicit_wait = 90
  @driver.manage.window.maximize
  @driver.manage.timeouts.page_load = 150
end

 def launch_driver_android_chrome
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120
    caps = {'chromeOptions'=> {'androidPackage' => 'com.android.chrome'}}
    @driver = Selenium::WebDriver.for(:remote, :http_client => client, :url => "http://localhost:9515", :desired_capabilities => caps)
    @driver.manage.timeouts.implicit_wait = 60

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


