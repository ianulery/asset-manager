FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'changeme' }
    password_confirmation { 'changeme' }
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
