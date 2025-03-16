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

Then('I should see that no location managers are assigned') do
  expect(page).to have_content('Location Managers: None')
end

When('I edit the location') do
  click_link 'Locations'
  within("\#location_#{@location.id}") do
    click_link 'Edit'
  end
end

When('assign the person as a manager of the location') do
  select @person.name, from: 'location_person_ids'
  click_button 'Update Location'
end

Then('the person should appear as an assigned manager') do
  expect(page).to have_content("Location Managers: #{@person.name}")
end

Given('there are multiple people') do
  @people = FactoryBot.create_list(:person, 5)
end

When('assign several people as managers of the location') do
  @selected_people = @people.sample(2)
  @selected_people.each do |person|
    select person.name, from: 'location_person_ids'
  end
  click_button 'Update Location'
end

Then('those people should appear as assigned managers') do
  within('#location_managers') do
    @selected_people.each do |person|
      expect(page).to have_content(person.name)
    end
  end
end

Given('the location has an assigned manager') do
  @person = FactoryBot.create(:person)
  @location = FactoryBot.create(:location, people: [@person])
end

When('remove the person as an assigned manager') do
  unselect @person.name, from: 'location_person_ids'
  click_button 'Update Location'
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
