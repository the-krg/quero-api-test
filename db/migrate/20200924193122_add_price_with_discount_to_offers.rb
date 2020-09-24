class AddPriceWithDiscountToOffers < ActiveRecord::Migration[6.0]
  def up
    add_column :offers, :price_with_discount, :float, null: false
  end

  def down
    remove_column :offers, :price_with_discount
  end
end
