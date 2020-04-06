require "selenium-webdriver" 


driver = Selenium::WebDriver.for :chrome
driver.manage.timeouts.implicit_wait = 10 # seconds
driver.navigate.to "http://zzzscore.com/1to50/en" 


#map indexes and numbers

$i = 1
$max = 25

indexes = Array.new(50) 

while $i <= $max  do
   element = driver.find_element(:css, '#grid > div:nth-child('+$i.to_s+')')
   index = element.text
   puts("Found "+index+" in position #$i")
   indexes[index.to_i] = $i 
   $i +=1
end

#click the first 25 elements
#update indexes for the second round

$i = 1
while $i <= $max  do
   index = indexes[$i]
   element = driver.find_element(:css, '#grid > div:nth-child('+index.to_s+') > .box') 
   element.click
   #sleep(0.2) #good enough solution for minimum time it takes to change to the new number
   index2 = $i
   while (index2.to_i == $i.to_i) || index2.empty? do
    #waiting for the number to change
    index2 = driver.find_element(:css, '#grid > div:nth-child('+index.to_s+')').text
   end
   puts("Clicked element #$i and turned to "+index2.to_s)
   indexes[index2.to_i] = index.to_i
   $i +=1
end 

#click the other 25

$i = 26
while $i <= 50  do
   index = indexes[$i]
   element = driver.find_element(:css, '#grid > div:nth-child('+index.to_s+') > .box') 
   element.click
   #sleep(0.2)
   puts("Clicked element #$i on position " + index.to_s)

   $i +=1
end 

element = driver.find_element(:css, '#result > div.resultContent > strong') 
time = element.text
puts("Resolved in " + time)

driver.save_screenshot("result.png")

driver.quit