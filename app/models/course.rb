class Course < ApplicationRecord
  belongs_to :campus
  has_many :offers
end
