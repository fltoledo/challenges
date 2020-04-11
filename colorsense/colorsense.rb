require "selenium-webdriver" 

#options = Selenium::WebDriver::Chrome::Options.new
#options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome#, options: options
driver.manage.timeouts.implicit_wait = 10 # seconds
driver.navigate.to "http://zzzscore.com/color/en/" 

begin
  while true do
    element = driver.find_element(:css, '.main') 
    element.click 
  end
rescue
  puts "The end <---------"
  #result
end

driver.save_screenshot("result.png")
driver.quit