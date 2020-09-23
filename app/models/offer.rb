class Offer < ApplicationRecord
  belongs_to :course
  belongs_to :university
  belongs_to :campus
end
