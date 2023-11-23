class AddHotdealsToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :hotdeals, :boolean
  end
end
