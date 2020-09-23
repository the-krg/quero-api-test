class RemoveUniversitiesFromCourses < ActiveRecord::Migration[6.0]
  def up
    remove_column :courses, :university_id
  end

  def down
    add_reference :courses, :university, foreign_key: true
  end
end
