class Order < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :user_id, presence: true
  validates :offer_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
