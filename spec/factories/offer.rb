FactoryBot.define do
  factory :offer do
    full_price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    discount_percentage { rand(1..90) }
    start_date { Date.today + rand(10..90).days }
    enrollment_semester { rand(1..2) }
    course { create(:course) }
    campus { course.campus }
    university { campus.university }
  end
end