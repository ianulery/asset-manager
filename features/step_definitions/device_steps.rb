Given('there is a device') do
  @device = FactoryBot.create(:device)
end

When('I view the device') do
  click_link 'Devices'
  click_link @device.item
end

When('I click the print asset label link') do
  click_link 'Print Asset Label'
end

Then('I should see a printable asset label') do
  expect(page.response_headers['Content-Type']).to eq('application/pdf')
end
