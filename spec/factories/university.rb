FactoryBot.define do
  factory :university do
    name { Faker::Educator.university }
    score  { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    logo_url { Faker::Internet.url }

    trait(:with_campus) do
      after(:create) { |u| create(:campus, university: u) }
    end
  end
end