class University < ApplicationRecord
  has_many :campuses
  has_many :courses, through: :campuses
  has_many :offers
end
