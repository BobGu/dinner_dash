class Order < ActiveRecord::Base
  class Status
    PAID      = "paid"
    CANCELLED = "cancelled"
    COMPLETED = "completed"
    ORDERED   = "ordered"

    ALL = [PAID, CANCELLED, COMPLETED, ORDERED]
  end

  def self.status_counts()
    result = Order.group(:order_status).count  # select status, count(*) from Order group by status
    Status::ALL.each {|key| result[key] ||= 0}
    result
  end

  def self.all_count
    Order.count
  end

  has_many    :order_items
  has_many    :items, through: :order_items
  #belongs_to  :user

  validates :user_id,          presence: true
  validates :order_total,      presence: true
  validates :order_type,       presence: true
  validates :delivery_address, presence: true, if: :delivery?
  validates :order_status,     presence: true
  validates :order_status, inclusion: {in: Status::ALL}

  def delivery?
    order_type == "delivery"
  end

  def cancelled?
    order_status == "cancelled"
  end

  def ordered?
    order_status == "ordered"
  end

  def paid?
    order_status == "paid"
  end
end
