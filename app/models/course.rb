class Course < ApplicationRecord
  include Filterable

  belongs_to :campus
  belongs_to :university
  has_many :offers

  FILTERS = %w(name level shift kind)

  scope :filter_by_university_name, -> (name) { University.find_by(name: name).courses }

  self.singleton_class.class_eval do
    FILTERS.each do |filter|
      define_method("filter_by_#{filter.downcase}".to_sym) do |param|
        Course.where("#{filter} = '#{param}'")
      end
    end
  end
end
