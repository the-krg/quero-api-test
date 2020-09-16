class CreateUniversities < ActiveRecord::Migration[6.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.float :score
      t.string :logo_url

      t.timestamps
    end
  end
end
