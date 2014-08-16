class Cart < ActiveRecord::Base
	# This holds our items until checkout
	# How can we make this hold our items
	# How can we just add one item to the cart
	# So we click on an item
	# It adds that item to our cart
	# and it saves it
	has_many :cart_items
	has_many :items, through: :cart_items

	def add_cart_item(data)
		Cart.cart_items.create(data.id)
	end

	
end
