FactoryBot.define do
  factory :location do
    name { Faker::Address.community }
    notes { Faker::Lorem.paragraph }

    factory :location_with_manager do
      people { [association(:person, locations: [instance])] }
    end
  end
end
