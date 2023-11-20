class AddPickupTimeToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :pickup_time_start, :time
    add_column :offers, :pickup_time_end, :time
    remove_column :offers, :pick_up_time, :time
  end
end
