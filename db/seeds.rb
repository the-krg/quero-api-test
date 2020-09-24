# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'factory_bot'
require 'faker'

FactoryBot.find_definitions

university = FactoryBot.create(:university)

2.times do
  campus = FactoryBot.create(:campus, university: university)

  10.times do
    course = FactoryBot.create(:course, campus: campus)

    FactoryBot.create(:offer, course: course)
  end
end