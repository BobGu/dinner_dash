class Order < ActiveRecord::Base
  class Status
    PAID = "paid"
    CANCELLED = "cancelled"
    COMPLETED = "completed"
    ORDERED = "ordered"

    ALL = [PAID, CANCELLED, COMPLETED, ORDERED]
  end
  
  has_many    :order_items
  has_many    :items, through: :order_items
  #belongs_to  :user

  validates :user_id,          presence: true
  validates :order_total,      presence: true
  validates :order_type,       presence: true
  # validates :delivery_address, presence: true
  #delivery address needs to validate only when it is delivery and not pick-up
  validates :order_status,     presence: true
  validates :order_status, inclusion: {in: Status::ALL}

end
