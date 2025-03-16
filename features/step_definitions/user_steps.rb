def create_visitor
  @visitor_hash ||= { 
    name: 'Testy McUserton',
    email: 'example@example.com',
    password: 'changeme',
    password_confirmation: 'changeme'
  }
end

def find_user
  @user ||= User.where(email: @visitor_hash[:email]).first
end

def create_user
  create_visitor
  delete_user
  @user = FactoryBot.create(:user, email: @visitor_hash[:email])
end

def delete_user
  @user ||= User.where(email: @visitor_hash[:email]).first
  @user.destroy unless @user.nil?
end

def sign_in_with_email_and_password(email, password)
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log In'
end

def sign_in
  sign_in_with_email_and_password(@visitor_hash[:email], @visitor_hash[:password])
end

Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor_hash = @visitor_hash.merge(email: 'wrong@example.com')
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor_hash = @visitor_hash.merge(password: 'wrongpass')
  sign_in
end

Then /^I should be signed in$/ do
  expect(page).to have_content('Logout')
  expect(page).not_to have_content('Log In')
end

Then /^I should be signed out$/ do
  expect(page).to have_content('Log in to continue')
  expect(page).not_to have_content('Logout')
end

Then /^I see a successful sign in message$/ do
  expect(page).to have_content('Signed in successfully.')
end

Then /^I should see a signed out message$/ do
  expect(page).to have_content('Signed out successfully.')
end

Then /^I see an invalid login message$/ do
  expect(page).to have_content('Invalid email or password.')
end
