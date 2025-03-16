Given('I am signed in') do
  @user = FactoryBot.create(:user)
  sign_in_with_email_and_password(@user.email, 'changeme')
end

Given('there is a location') do
  @location = FactoryBot.create(:location)
end

When('I view the location') do
  click_link 'Locations'
  click_link @location.name
end

When('I edit the location') do
  click_link 'Locations'
  within("\#location_#{@location.id}") do
    click_link 'Edit'
  end
end

When('I view the locations page') do
  click_link 'Locations'
end

Then('the location should show {int} in the device count column') do |device_count|
  within("#location_#{@location.id} .device-count") do
    expect(page).to have_content(device_count)
  end
end

Given('the location has {int} devices') do |device_count|
  FactoryBot.create_list(:device, device_count, location: @location)
end

Then('the person should appear as an assigned manager on the locations index page') do
  click_link 'Locations'
  within("#location_#{@location.id} .location-managers") do
    expect(page).to have_content(@person.name)
  end
end

Then('those people should appear as assigned managers on the locations index page') do
  click_link 'Locations'
  within("#location_#{@location.id} .location-managers") do
    @selected_people.each do |person|
      expect(page).to have_content(person.name)
    end
  end
end

Then('the location index page should show no assigned managers') do
  click_link 'Locations'
  within("#location_#{@location.id} .location-managers") do
    expect(page).to have_content('None')
  end
end

Given('the location has location managers') do
  @location_managers = FactoryBot.create_list(:person, 2)
  @location.update(people: @location_managers)
end

When('I click the {string} link') do |string|
  click_link string
end

Then('the location managers should receive an inventory email') do
  @location_managers.each do |person|
    step "\"#{person.email}\" should receive an email"
  end
end

When('I view the location details page') do
  click_link @location.name
end

Then('I should see an alert that the location has no managers') do
  expect(page).to have_content('No location managers are assigned')
end

Given('there are multiple locations with managers') do
  @locations = FactoryBot.create_list(:location_with_manager, 5)
end

When('I click the send inventory emails button') do
  click_link 'Send Inventory Emails'
end

Then('the location managers should receive inventory emails') do
  @locations.each do |location|
    location.people.each do |location_manager|
      step "\"#{location_manager.email}\" should receive an email"
    end
  end
end

Then('the page should show that the emails were sent') do
  expect(page).to have_content('Inventory e-mails sent')
end
