require "selenium-webdriver" 
require "./Util"

#options = Selenium::WebDriver::Chrome::Options.new
#options.add_argument('--headless')
driver = Selenium::WebDriver.for :chrome#, options: options
driver.manage.timeouts.implicit_wait = 10 # seconds
driver.navigate.to "https://www.setgame.com/set/puzzle" 


#I need to make the cards visible to be clicked 
driver.execute_script("window.scrollTo(0, 400)")

$i = 1
$max = 10
$total=0
 
begin
  while $i <= $max  do
    $j = $i + 1
    $max2 = 11
    while $j <= $max2  do
        $k = $j + 1
        $max3 = 12
        while $k <= $max3  do
          $total +=1
          puts("about to click: #$i, #$j, #$k - try number: #$total")
          element = driver.find_element(:name, 'card'+$i.to_s) 
          element.click 
          element2 = driver.find_element(:name, 'card'+$j.to_s) 
          element2.click
          element3 = driver.find_element(:name, 'card'+$k.to_s) 
          element3.click
          $k +=1
          sleep 0.01
        end
        $j +=1
    end
    $i +=1
  end
rescue
  puts "Last set was #$i, #$j, #$k"
end

driver.save_screenshot("result.png")
driver.quit