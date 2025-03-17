FactoryBot.define do
  factory :device do
    item { "#{Faker::Device.manufacturer} #{Faker::Device.model_name}" }
    notes { Faker::Lorem.paragraph }
    acquired_at { Faker::Date.between(from: 15.years.ago, to: Date.today) }
    location
    person
  end
end
