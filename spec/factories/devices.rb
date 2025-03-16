FactoryBot.define do
  factory :device do
    item { "#{Faker::Device.manufacturer} #{Faker::Device.model_name}" }
    notes { Faker::Lorem.paragraph }
    location
    person
  end
end
