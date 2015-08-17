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