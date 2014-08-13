class Categorization < ActiveRecord::Base
	belongs_to	:category
	belongs_to :item
	validates :item_id, presence: true
	validates :category_id, presence: true
end
