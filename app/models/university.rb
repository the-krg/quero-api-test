class University < ApplicationRecord
  has_many :campuses
  has_many :courses, through: :campuses
end
