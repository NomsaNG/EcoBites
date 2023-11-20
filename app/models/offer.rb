class Offer < ApplicationRecord
  belongs_to :shop, class_name: 'User', foreign_key: 'user_id'
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :pickup_time_start, presence: true
  validates :pickup_time_end, presence: true
  validates :pickup_instructions, presence: true

  validates :picture, presence: true
end
