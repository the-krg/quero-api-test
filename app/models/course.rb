class Course < ApplicationRecord
  belongs_to :campus
  belongs_to :university
  has_many :offers
end
