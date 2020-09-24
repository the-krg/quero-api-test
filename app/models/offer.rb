class Offer < ApplicationRecord
  include Filterable

  belongs_to :course
  belongs_to :university
  belongs_to :campus

  COURSE_FILTERS = %w(name level shift kind)

  scope :filter_by_university_name, -> (name) { University.find_by(name: name).offers }
  scope :filter_by_city, -> (city) { Campus.find_by(city: city).offers }
  scope :order_by_price_with_discount, -> (order) { Offer.order(price_with_discount: order) }

  self.singleton_class.class_eval do
    COURSE_FILTERS.each do |filter|
      define_method("filter_by_course_#{filter.downcase}".to_sym) do |param|
        course = Course.find_by("#{filter} = '#{param}'")

        course.present? ? course.offers : {}
      end
    end
  end
end
