FactoryBot.define do
  factory :campus do
    name { Faker::Name.middle_name }
    city { Faker::Address.city }
    university { create(:university) }
  end
end