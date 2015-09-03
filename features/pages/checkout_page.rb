# Name: checkout_page.rb
# Copyright 2015, Opex Software
# Apache License, Version 2.0
# This is a page object file for Magento Checkout page containing web-elements and its interactive methods


class CheckoutPage < PageObject

  element :search_box, {id: "search"}
  element :search_button, {css: "button[title*='Search']"}
  element :product_catalog, {css: "div.category-products"}
  element :proceed_to_checkout, {css: "button[title*='Proceed to Checkout']"}
  element :checkout_as_guest_radio, {id: "login:guest"}
  element :checkout_continue_button, {id: "onepage-guest-register-button"}
  element :page_primary_message ,{css: "div.page-title h1"}
  element :page_secondary_message, {css: "h2"}

  element :billing_first_name, {id: "billing:firstname"}
  element :billing_last_name, {id: "billing:lastname"}
  element :billing_email, {id: "billing:email"}
  element :billing_address, {id: "billing:street1"}
  element :billing_city, {id: "billing:city"}
  element :billing_state, {id: "billing:region_id"}
  element :billing_zip, {id: "billing:postcode"}
  element :billing_country, {id: "billing:country_id"}
  element :billing_phone, {id: "billing:telephone"}
  element :billing_continue_button, {css: "#billing-buttons-container button"}
  element :shipping_method_continue_button, {css: "#shipping-method-buttons-container button"}

  element :payment_check, {id: "p_method_checkmo"}
  element :payment_cc, {id: "p_method_ccsave"}
  element :payment_cod, {id: "p_method_cashondelivery"}
  element :payment_continue_button, {css: "#payment-buttons-container button"}
  element :cc_name, {id: "ccsave_cc_owner"}
  element :cc_type, {id: "ccsave_cc_type"}
  element :cc_number, {id: "ccsave_cc_number"}
  element :cc_expiration_month, {id: "ccsave_expiration"}
  element :cc_expiration_year, {id: "ccsave_expiration_yr"}

  element :place_order_button, {css: "button.btn-checkout"}


  def initialize(page_driver)
    @driver = page_driver
  end

  def fill_and_submit_billing_information(type)
    select_drop_down_by_text("billing:country_id","India")
    if type == "guest"
      billing_first_name.send_keys(Faker::Name.first_name)
      billing_last_name.send_keys(Faker::Name.last_name)
      billing_email.send_keys(Faker::Internet.email)
    end
    billing_address.send_keys("Turning Point II")
    billing_city.send_keys("Pune")
    billing_zip.send_keys("411014")
    billing_phone.send_keys("02026632223")
    billing_continue_button.click
  end

  def fill_credit_card_information
    select_drop_down_by_text("ccsave_cc_type","Visa")
    cc_name.send_keys("Opex Software")
    cc_number.send_keys("4111111111111111")
    select_random_value_from_dropdown("ccsave_expiration")
    select_drop_down_by_text("ccsave_expiration_yr","2025")
  end

end
