Then("Left Unit picker value should be {string}") do |value|
  # find element using xpath
  datax = find_element(id: "select_unit_spinner").text
  #datax =  find_element(:xpath, "(//android.widget.RelativeLayout[1])[4]").text

  if datax != value
    fail("Expected right unit picker value is #{value}, Actual value is #{datax}")
  else
    print("Data sesuai")
  end

end

Then("Right Unit picker value should be {string}") do |value2|
  # find element using xpath
  dataz =  find_element(xpath: "(//android.widget.RelativeLayout/android.widget.TextView[1])[2]").text

  if dataz != value2
    fail("Expected right unit picker value is #{value2}, Actual value is #{dataz}")
  else
    print("Data sesuai")
  end
end

#untuk button disable & enable dalam satu step (get value enable atau disable)
Then(/^Show all button should be (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?

  #print(button_state)

  if state == "enabled"
    if button_state !=  true
      fail("Button not enable")
    end 
  elsif state == "disabled"
    if button_state != false
      fail("button not disable")
    end
  end
end

When(/^i press on clear button$/) do
  print("clear button is pressed")
end

When(/^i type "([^"]*)" on application keyboard$/) do |target|
  #find element di dalam class (hanya untuk 1 kali tap)
      #find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{target}']").click

  #untuk klik numpad keyboard lebih dari sekali menggunakan each do
  x = target.split("")
  x.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end

Then(/^i should see result as "([^"]*)"$/) do |result|
  x = find_element(id: "target_value").text

  if x != result
    fail("Expected value is #{result}, Actual value is #{x}")
  else
    print("Data sesuai")
  end
end

Then(/^i press on favorite icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^i press favorite conversions$/) do
  text("Favorite conversions").click
end

And(/^i verify "([^"]*)" added to favorite conversions list$/) do |unit_type|
  text(unit_type)
end

##================ START Scenario 5 selector ================##

Then(/^i press on search icon$/) do
  find_element(id: "action_search").click
end

Then(/^i type "([^"]*)" in search field$/) do |search|
  find_element(id: "search_src_text").send_keys(search)
end

And(/^i press return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:1001, y:1718, count: 1).perform
end

Then(/^i should see "([^"]*)" as a current unit converter$/) do |curren_unit|
  #cara untuk locate element container
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{curren_unit}']")
end

Then(/^convertion unit must be "([^"]*)"$/) do |arg|
  x = find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView").text

  if x != arg
    fail("unit converter tidak sesuai, value akhir akan berbeda!!!c")
  else
    printf("Unit converter sesuai ")
  end

end

Then('i wait for {int} seconds') do |int|
  sleep(int)
end
##================ END Scenario 5 selector ================##

