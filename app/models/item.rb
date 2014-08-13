class Item < ActiveRecord::Base
	has_many	:categorizations
	has_many	:categories, through: :categorizations

  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :price_slice, presence: true
  validates :price_pie,   presence: true
end
