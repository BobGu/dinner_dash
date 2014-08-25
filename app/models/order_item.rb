class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item

	def increment!
		
	end
end
