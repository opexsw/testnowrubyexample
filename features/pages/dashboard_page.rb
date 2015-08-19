# Name: dashboard_page.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is a page object file for Magento Dashboard page containing web-elements and its interactive methods


class DashboardPage < PageObject

  element :save_button, {css: "button[title*='Save']"}
  element :general_subscription_checkbox, {id: "subscription"}
  element :success_message, {css: "li.success-msg span"}
  element :newsletter_subscription_textbox, {id: "newsletter"}
  element :subscribe_button, {css: "button[title*='Subscribe']"}

  def initialize(page_driver)
    @driver = page_driver
  end
end