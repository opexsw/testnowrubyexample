# Name: dashboard_steps.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is a cucumber step-definitions file containing implementations of GWT's feature steps


When /^I edit (newsletter|contact|billing|shipping) section on My Dashboard page$/ do |section|
  driver.find_element(xpath: "//h3[contains(text(),'#{section.capitalize}')]/parent::div/a").click
end

When /^I (de-select|select) General Subscription option$/ do |action|
  dash = DashboardPage.new(@driver)
  if action == "select"
    checkbox_check(dash.general_subscription_checkbox)
  elsif action == "de-select"
    checkbox_uncheck(dash.general_subscription_checkbox)
  end
end

Then /^I should see (success|error) message for "([^"]*)" on(?: dashboard)? page$/ do |type,message|
  msg = driver.find_element(css: "li.#{type}-msg span").text
  case message
    when "subscription_saved"
      msg.should == "The subscription has been saved."
    when "subscription_removed"
      msg.should == "The subscription has been removed."
    when "newsletter_subscription_saved"
      msg.should == "Thank you for your subscription."
    when "newsletter_subscription_error"
      msg.should == "There was a problem with the subscription: This email address is already assigned to another user."
  end
end

Given /^I enter a (fresh|registered) email id in newsletter subscriprion box$/ do |fresh_or_used|
  dash = DashboardPage.new(@driver)
  if fresh_or_used == "fresh"
    dash.newsletter_subscription_textbox.send_keys(Faker::Internet.email)
  elsif fresh_or_used == "registered"
    dash.newsletter_subscription_textbox.send_keys("admin@mailinator.com")
  end
end
