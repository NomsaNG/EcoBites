class Offer < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :pickup_time_start, presence: true
  validates :pickup_time_end, presence: true
  validates :pickup_instructions, presence: true
  validates :title, presence: true
  validates :shop, presence: true
end
