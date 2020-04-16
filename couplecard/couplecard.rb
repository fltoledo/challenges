require "selenium-webdriver" 

#options = Selenium::WebDriver::Chrome::Options.new
#options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome#, options: options
driver.manage.timeouts.implicit_wait = 10 # seconds
driver.navigate.to "http://zzzscore.com/memory/en/" 

images = ['birthday-cake', 'bolt', 'bomb', 'book', 'car', 'coffee', 'cube', 'cubes']

images.each { |item|
  str = "//div/span[@class='fa fa-" + item +"'][@style='display: none;']/.."
  element = driver.find_element(:xpath, str)
  element.click 
  element = driver.find_element(:xpath, str)
  element.click 
}

driver.save_screenshot("result.png")
driver.quit