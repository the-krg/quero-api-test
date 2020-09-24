class OfferSerializer < ActiveModel::Serializer
  attributes :full_price, :discount_percentage, :start_date, :enrollment_semester, :enabled, :price_with_discount

  belongs_to :course
  belongs_to :university
  belongs_to :campus
end
