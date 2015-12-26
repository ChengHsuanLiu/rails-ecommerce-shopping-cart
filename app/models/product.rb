class Product < ActiveRecord::Base
	has_many :product_variations
	has_many :product_variation_values
	has_many :product_attributes
	has_many :product_comments
	has_many :product_images
	belongs_to :brand


  has_many :product_child_products
  has_many :child_products, class_name: :Product, through: :product_child_products,
                            source: :child_product
  has_many :product_parent_product, class_name: :ProductChildProduct, foreign_key: :child_product_id
  has_many :parent_products, class_name: :Product, through: :product_parent_product,
                       source: :product
end
