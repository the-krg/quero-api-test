FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    kind { Faker::Educator.subject }
    level { Faker::Educator.degree }
    shift { %w(Day Night).sample }
    campus { create(:campus) }
    university { campus.university }
  end
end