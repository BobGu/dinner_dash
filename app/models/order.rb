class Order < ActiveRecord::Base
  validates :user_id,          presence: true
  validates :order_total,      presence: true
  validates :order_type,       presence: true
  validates :delivery_address, presence: true
  validates :order_status,     presence: true
end
