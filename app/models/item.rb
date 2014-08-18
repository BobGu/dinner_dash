class Item < ActiveRecord::Base
	has_many	:categorizations
	has_many	:categories, :through => :categorizations
  has_many :order_items
  has_many :orders, :through => :order_items
  has_many :cart_items
  has_many :carts, :through => :cart_items

  validates :title,       presence: true, uniqueness: true
  # validates :price_slice, presence: true
  # validates :price_pie,   presence: true
	# validates :inventory,   presence: true
end
