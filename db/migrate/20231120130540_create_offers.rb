class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.text :description
      t.integer :quantity
      t.float :unit_price
      t.time :pick_up_time
      t.references :user, null: false, foreign_key: true
      t.string :picture
      t.text :pickup_instructions

      t.timestamps
    end
  end
end
