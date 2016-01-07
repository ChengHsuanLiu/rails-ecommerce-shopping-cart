class ProductVariationValue < ActiveRecord::Base
	belongs_to :product_variation

	has_many :product_product_variation_value_ships
	has_many :products, through: :product_product_variation_value_ships
end
