class LoginPage < PageObject

  element :account_section, {css: "a.skip-account"}
  element :login_link, {css: "a[title*='Log In']"}
  element :logout_link, {css: "a[title*='Log Out']"}
  element :register_link, {css: "a[title*='Register']"}
  element :magento_logo, {css: "img.large"}

  element :username, {id: "email"}
  element :password, {id: "pass"}
  element :login_button, {id: "send2"}
  element :error_message, {css: "li.error-msg span"}
  element :success_message, {css: "li.success-msg span"}
  element :mandatory_email_message, {id: "advice-required-entry-email"}
  element :mandatory_password_message, {id: "advice-required-entry-pass"}

  element :register_button, {css: "button[title*='Register']"}
  element :first_name_textbox, {id: "firstname"}
  element :last_name_textbox, {id: "lastname"}
  element :email_address_textbox, {id: "email_address"}
  element :password_textbox, {id: "password"}
  element :confirm_password_textbox, {id: "confirmation"}
  element :mandatory_first_name_message, {id: "advice-required-entry-firstname"}
  element :mandatory_last_name_message, {id: "advice-required-entry-lastname"}
  element :mandatory_email_address_message, {id: "advice-required-entry-email_address"}
  element :mandatory_register_password_message, {id: "advice-required-entry-password"}
  element :mandatory_confirm_password_message, {id: "advice-required-entry-confirmation"}

  def initialize(page_driver)
    @driver=page_driver
  end

  def go_to_homepage(portal)
    if portal == "customer"
      driver.get(ENV['TEST_URL'])
      #raise "Not on Magento Homepage" unless is_homepage?
    elsif portal == "admin"
      driver.get("https://104.131.191.140/index.php/admin")
      raise "Not on Magento Admin Page" unless is_admin_page?
    end
  end

  def is_homepage?
    magento_logo.displayed?
  end

  def is_admin_page?
    true
  end

  def login(email,pword)
    username.send_keys(email)
    password.send_keys(pword)
    login_button.click
  end

  def logout
    account_section.click
    logout_link.click
  end


  def verify_mandatory_fields_message(where)
    message = "This is a required field."
    if where == "login"
      mandatory_email_message.text.should == message
      mandatory_password_message.text.should == message
    elsif where == "registration"
      mandatory_first_name_message.text.should == message
      mandatory_last_name_message.text.should == message
      mandatory_email_address_message.text.should == message
      mandatory_register_password_message.text.should == message
      mandatory_confirm_password_message.text.should == message
    end
  end

  def register(user_type)
    if user_type == "new"
      email = Faker::Internet.email
      first_name_textbox.send_keys(Faker::Name.first_name)
      last_name_textbox.send_keys(Faker::Name.last_name)
      email_address_textbox.send_keys(email)
      password_textbox.send_keys("password123")
      confirm_password_textbox.send_keys("password123")
      return email
    elsif user_type == "existing"
      first_name_textbox.send_keys(Faker::Name.first_name)
      last_name_textbox.send_keys(Faker::Name.last_name)
      email_address_textbox.send_keys("admin@mailinator.com")
      password_textbox.send_keys("password123")
      confirm_password_textbox.send_keys("password123")
    end
  end
end