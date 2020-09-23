class AddEnabledToOffers < ActiveRecord::Migration[6.0]
  def up
    add_column :offers, :enabled, :boolean, default: true
  end

  def down
    remove_column :offers, :enabled
  end
end
