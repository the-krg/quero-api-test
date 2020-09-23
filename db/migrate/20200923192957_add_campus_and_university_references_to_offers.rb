class AddCampusAndUniversityReferencesToOffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :campus, index: true
    add_reference :offers, :university, index: true
  end
end
