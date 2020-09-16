class Campus < ApplicationRecord
  belongs_to :university
  has_many :courses
  has_many :offers, through: :courses
end
