Given('there are several locations') do
    @locations = FactoryBot.create_list(:location, rand(10))
  end
  
Given('each location has several devices') do
  @locations.each do |location|
    FactoryBot.create_list(:device, rand(10), location: location)
  end
end

When('I view the inventory report') do
  click_link('Reports')
  click_link('Location Inventory')
end

Then('the report should include the locations') do
  @locations.each do |location|
    expect(page).to have_content(location.name)
  end
end

Then('the report should include the devices') do
  @locations.each do |location|
    location.devices.each do |device|
      expect(page).to have_content(device.item)
    end
  end
end

Given('there are several devices') do
  @devices = FactoryBot.create_list(:device, rand(10))
end

Then('the device aging report should include the devices') do
  @devices.each do |device|
    expect(page).to have_content(device.item)
  end
end

When('I view the reports page') do
  click_link('Reports')
end

When('I view the device aging report') do
  click_link('Device Aging')
end

Then('the report should include the device ages') do
  @devices.each do |device|
    expect(page).to have_content(device.item)
  end
end
