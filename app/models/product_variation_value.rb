class ProductVariationValue < ActiveRecord::Base
	belongs_to :product_variation
	has_many :products
end
