class ProductVariation < ActiveRecord::Base
	belongs_to :product
	has_many :product_variation_values
end
