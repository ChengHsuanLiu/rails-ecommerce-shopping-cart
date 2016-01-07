class Product < ActiveRecord::Base
	has_many :product_attributes
	has_many :product_comments
	has_many :product_images
	belongs_to :brand

  has_many :order_products
  has_many :orders, through: :order_products

	has_many :product_product_variation_value_ships
	has_many :product_variation_values, through: :product_product_variation_value_ships

  has_many :user_cart_items
  has_many :users, through: :user_cart_items

  has_many :product_child_products
  has_many :child_products, class_name: :Product, through: :product_child_products,
                            source: :child_product
  has_many :product_parent_product, class_name: :ProductChildProduct, foreign_key: :child_product_id
  has_many :parent_products, class_name: :Product, through: :product_parent_product,
                       source: :product

  validates :is_multi_option, :inclusion => {:in => [true, false]}
  validates :visible, :inclusion => {:in => [true, false]}
  validates :available, :inclusion => {:in => [true, false]}
  validates :is_child_product, :inclusion => {:in => [true, false]}
  validates :stock_active, :inclusion => {:in => [true, false]}
  validates :name, presence: true
end
