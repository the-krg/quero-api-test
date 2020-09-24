class OfferSerializer < ActiveModel::Serializer
  attributes :full_price, :discount_percentage, :start_date, :enrollment_semester, :enabled, :price_with_discount

  belongs_to :course
  belongs_to :university
  belongs_to :campus

  def price_with_discount
    object.full_price - ((object.full_price * object.discount_percentage)/100).truncate(2)
  end
end
