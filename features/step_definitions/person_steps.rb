Given("there is a person") do
  @person = FactoryBot.create(:person)
end

Given("the person has no assigned devices") do
  expect(@person.devices).to be_empty
end

When("an inventory email is sent") do
  @person.send_inventory_email
end

Then("the email should say that no devices are assigned") do
  step "\"#{@person.email}\" should receive an email"
  step 'they open the email'
  step 'they should see "No IT equipment is currently assigned." in the email body'
end

Given("the person has assigned devices") do
  number_of_devices = rand(1..5)

  @devices = FactoryBot.create_list(
    :device,
    number_of_devices,
    person: @person
  )

  expect(@person.devices.count).to eq(@devices.count)
end

Then("the email should include their assigned devices") do
  step "\"#{@person.email}\" should receive an email"
  step 'they open the email'
  @devices.each do |device|
    step "they should see \"#{device.item}\" in the email body"
  end
end

When('I access the people index page') do
  click_link 'People'
end

When('I send an equipment inventory email to the person') do
  click_link 'Send Inventory Email'
end

Then('they should receive an equipment inventory email') do
  step "\"#{@person.email}\" should receive an email"
end

Then('the page should show that the email was sent') do
  expect(page).to have_content('Inventory e-mail sent')
end

When("I view the person's detail page") do
  click_link 'View'
end

Given('there are people') do
  @people = FactoryBot.create_list(:person, 5)
end

When('I view the people page') do
  click_link 'People'
end

Then('all people should receive inventory emails') do
  @people.each do |person|
    step "\"#{person.email}\" should receive an email"
  end
end
