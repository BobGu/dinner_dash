class Item < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :retire, inclusion: { in: ['true', 'false'] }


  has_many  :categorizations
  has_many  :categories, through: :categorizations

  has_many  :order_items
  has_many  :orders, through: :order_items
  has_many  :cart_items
  has_many  :carts, through: :cart_items

  scope :not_retired, -> { where(retire: 'f') }
  scope :retired, -> { where(retire: 't') }

  def category_names
    categories.join(", ")
  end

  def categories_list(category_list)
    if category_list
      valid_categories = category_list.reject do |cat|
        cat.empty?
      end

      new_or_found_categories = valid_categories.map do |name|
        Category.find_or_create_by(name: name)
      end

      self.categories = new_or_found_categories
    end
  end
  # def category_names=(categories_string)
  #   category_names          = categories_string.split(",").collect{ |s| s.strip}.uniq
  #   new_or_found_categories = category_names.collect {|name| Category.find_or_create_by(name: name) }
  #   self.categories         = new_or_found_categories
  # end

  def to_s
    title
  end


end
