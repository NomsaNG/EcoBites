class AddTitleAndShopToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :title, :string
    add_column :offers, :shop, :string
  end
end
