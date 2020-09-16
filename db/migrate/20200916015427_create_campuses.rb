class CreateCampuses < ActiveRecord::Migration[6.0]
  def change
    create_table :campuses do |t|
      t.string :name
      t.string :city
      t.references :university, null: false, foreign_key: true

      t.timestamps
    end
  end
end
