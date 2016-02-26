# Name: common_steps.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is a cucumber step-definitions file containing implementations of GWT's feature steps


Then /^I should be on "([^"]*)" page$/ do |page|
  case page
    when "My Dashboard"
      driver.find_element(css: "div.dashboard h1").text.should == page.upcase
    when "Logout"
      if ENV['BROWSER'].downcase != "ie"
        driver.find_element(css: "div.page-title").text.include?("LOGGED OUT").should == true
      end
  end
end

When /^I click the (register|save|subscribe) button$/ do |button|
  case button
    when "register"
      login = LoginPage.new(@driver)
      login.register_button.click
    when "save"
      dash = DashboardPage.new(@driver)
      dash.save_button.click
    when "subscribe"
      dash = DashboardPage.new(@driver)
      dash.subscribe_button.click
  end
end

