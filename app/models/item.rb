class Item < ActiveRecord::Base
	has_many	:categorizations
	has_many	:categories, through: :categorizations

  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_slice, presence: true
  validates :price_pie,   presence: true

  has_many :order_items
  has_many :orders, through: :order_items
  has_many :cart_items
  has_many :carts, through: :cart_items


  def category_names
  	categories.pluck(:name).join(", ")
  end

