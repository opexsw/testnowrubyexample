module TestNowRubyExample

  def wait_for_title text , timeout = 10
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    wait.until { driver.title.include? text }
  end

  def select_drop_down_by_text drop_down ,text
    Selenium::WebDriver::Support::Select.new(driver.find_element(:id => drop_down)).select_by :text, text
  end

  def select_drop_down_by_name drop_down ,text
    Selenium::WebDriver::Support::Select.new(driver.find_element(:name => drop_down)).select_by :text, text
  end

  def select_drop_down_by_xpath drop_down ,text
    Selenium::WebDriver::Support::Select.new(driver.find_element(:xpath => drop_down)).select_by :text, text
  end


  def select_drag_and_drop target , source
    target = @driver.find_element(:xpath => target)
    source = @driver.find_element(:xpath => source)
    @driver.action.drag_and_drop(target, source).perform
  end


  def wait_for_element element_hash, timeout = 10
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds+
    wait.until { driver.find_element element_hash }
  end

  def select_random_value_from_dropdown(id)
    options = @driver.find_elements(xpath: "//select[@id='#{id}']/option")
    value = options[rand(1..options.size-1)].text
    p "******* Random value selected is #{value} *******"
    select_drop_down_by_text(id,value)
    #@driver.find_element(id: "#{id}").send_keys(value)
    return value
  end

  def select_random_value_from_dropdown_using_xpath(select_box_xpath)
    options = @driver.find_elements(xpath: select_box_xpath)
    value = options[rand(1..options.size-1)].text
    p "****** Random Value selected is #{value} ******"
    new_select_xpath = select_box_xpath.split("/option")[0]
    select_drop_down_by_xpath(new_select_xpath,value)
    #@driver.find_element(xpath: new_select_xpath).send_keys(value)
    return value
  end

  def upload_file(id,file_path)
    p "*** uploading file (#{file_path}) ***"
    if ENV['REMOTE'] != "local"
      @driver.file_detector = lambda do |args|
        # args => ["/path/to/file"]
        str = args.first.to_s
        str if File.exist?(str)
      end
    end
    @driver.find_element(id: "#{id}").send_keys(file_path)
  end

  def click object
    return_string = object.native.click
    check_firefox_alertbox if return_string == "Continue"
#check_chrome_alertbox if return_string == "Continue"
  end

  def wait_for_ajax timeout = 60
    wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
    wait.until { driver.execute_script("$.active").to_i == 0 }
  end

  def switch_to_child_window(parent)
    window_handles = @driver.window_handles
    window_handles.each do |handle|
      if handle != parent
        @driver.switch_to.window(handle)
      end
    end
  end

  def close_child_switch_to_parent(parent)
    @driver.close
    @driver.switch_to.window(parent)
  end

  def checkbox_check(element)
    if !element.selected?
      element.click
    end
  end

   def checkbox_uncheck(element)
    if element.selected?
      element.click
    end
  end
end
