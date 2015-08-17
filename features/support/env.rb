require 'rubygems'
require 'rspec'
require 'selenium-webdriver'
require 'cucumber'
require 'rake'
require 'faker'
require 'selenium_fury'
require 'json'

include RSpec::Matchers

include SeleniumFury::SeleniumWebDriver::CreateSeleniumWebDriver

require File.dirname(__FILE__) + "/../support/driver_config"
require File.dirname(__FILE__) + "/../support/utilities"
include MagentoAutomation
