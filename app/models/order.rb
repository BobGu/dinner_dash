class Order < ActiveRecord::Base
  validates :user_id,          presence: true
  validates :order_total,      presence: true
  validates :order_type,       presence: true
  validates :delivery_address, presence: true
  validates :order_status,     presence: true
  has_many  :order_items
  has_many  :items, through: :order_items
end
