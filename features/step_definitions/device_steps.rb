Given('there is a device') do
  @device = FactoryBot.create(:device)
end

When('I view the devices page') do
  click_link 'Devices'
end

Then('I should see the device') do
  expect(page).to have_content(@device.item)
end

When('I edit the device') do
  click_link(@device.item)
  click_link('Edit')
end

When('I mark the device as discarded') do
  check('Is Discarded')
  click_button('Save')
end

Then('the device should no longer appear on the devices page') do
  click_link('Devices')
  expect(page).not_to have_content(@device.item)
end

Given('the device is discarded') do
  @device.update(is_discarded: true)
end

When('enable the show discarded devices option') do
  check('Show discarded devices')
  click_button('Submit')
end

Then('the discarded device should appear') do
  expect(page).to have_content(@device.item)
end

Then('the show discarded devices checkbox should be checked') do
  expect(page).to have_checked_field('Show discarded devices')
end
