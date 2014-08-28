class CartItem < ActiveRecord::Base
	belongs_to :item
	belongs_to :cart

	delegate :price_pie, to: :item
	
end
