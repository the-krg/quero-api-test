class CourseSerializer < ActiveModel::Serializer
  attributes :name, :kind, :level, :shift

  belongs_to :campus
  belongs_to :university
end
