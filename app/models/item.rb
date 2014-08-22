class Item < ActiveRecord::Base
  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true



  has_many  :categorizations
  has_many  :categories, through: :categorizations

  has_many  :order_items
  has_many  :orders, through: :order_items
  has_many  :cart_items
  has_many  :carts, through: :cart_items

  def category_names
    categories.join(", ")
  end

  def category_names=(categories_string)
    category_names          = categories_string.split(",").collect{ |s| s.strip}.uniq
    new_or_found_categories = category_names.collect {|name| Category.find_or_create_by(name: name) }
    self.categories         = new_or_found_categories
  end

  def to_s
    title
  end
end
