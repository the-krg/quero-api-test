class AddCampusAndUniversityReferencesToOffers < ActiveRecord::Migration[6.0]
  def up
    add_column :offers, :campus_id, :bigint, default: true, foreign_key: true, null: false
    add_column :offers, :university_id, :bigint, default: true, foreign_key: true, null: false
  end

  def down
    remove_column :offers, :campus_id
    remove_column :offers, :university_id
  end
end
