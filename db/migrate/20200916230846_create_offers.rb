class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.float :full_price
      t.float :discount_percentage
      t.date :start_date
      t.string :enrollment_semester
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
