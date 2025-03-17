FactoryBot.define do
  factory :location do
    name { Faker::Address.community }
    notes { Faker::Lorem.paragraph }
  end
end
