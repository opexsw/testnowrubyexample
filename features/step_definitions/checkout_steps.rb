# Name: checkout_steps.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is a cucumber step-definitions file containing implementations of GWT's feature steps


When /^I do a global search using "([^"]*)" keyword$/ do |keyword|
  checkout = CheckoutPage.new(@driver)
  Selenium::WebDriver::Wait.new(timeout: 30).until {checkout.search_box_link.displayed?}
  checkout.search_box_link.click
  checkout.search_box.send_keys(keyword)
  checkout.search_button.click
  #checkout.search_box.send_keys(:return)
end

Then /^I should see products$/ do
  checkout = CheckoutPage.new(@driver)
  Selenium::WebDriver::Wait.new(timeout: 30).until {checkout.product_catalog.displayed?}
  checkout.product_catalog.displayed?.should == true
end

Then /^I add to cart the product (?:based on|number) (RUN_INDEX|\d+)$/ do |index|
  checkout = CheckoutPage.new(@driver)
  checkout.add_product_to_cart(index)
end

Then /^I proceed to checkout$/ do
  checkout = CheckoutPage.new(@driver)
  checkout.proceed_to_checkout.click
end

When /^I select checkout method as Guest$/ do
  checkout = CheckoutPage.new(@driver)
  checkout.checkout_as_guest_radio.click
  checkout.checkout_continue_button.click
end

When /^I fill all mandatory details in Billing Information as (member|guest)$/ do |type|
  checkout = CheckoutPage.new(@driver)
  checkout.fill_and_submit_billing_information(type)
end

When /^I continue with shipping method$/ do
  checkout = CheckoutPage.new(@driver)
  Selenium::WebDriver::Wait.new(timeout: 30).until {checkout.shipping_method_continue_button.displayed?}
  checkout.shipping_method_continue_button.click
end

When /^I select payment method as "(check|credit_card|cash_on_delivery)"$/ do |payment_method|
  checkout = CheckoutPage.new(@driver)
  case payment_method
    when "check"
      checkout.payment_check.click
    when "cash_on_delivery"
      checkout.payment_cod.click
    when "credit_card"
      checkout.payment_cc.click
      sleep(1)
      checkout.fill_credit_card_information
  end
  checkout.payment_continue_button.click
end

Then /^I place the order$/ do
  checkout = CheckoutPage.new(@driver)
  Selenium::WebDriver::Wait.new(timeout: 30).until {checkout.place_order_button.displayed?}
  checkout.place_order_button.click
end

Then /^I should see order confirmation message$/ do
  checkout = CheckoutPage.new(@driver)
  Selenium::WebDriver::Wait.new(timeout: 60).until {driver.current_url.include?('success')}
  driver.find_element(tag_name: "h1").text.should == "YOUR ORDER HAS BEEN RECEIVED."
  driver.find_element(tag_name: "h2").text.should == "THANK YOU FOR YOUR PURCHASE!"
end