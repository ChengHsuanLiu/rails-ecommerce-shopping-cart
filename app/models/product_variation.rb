class ProductVariation < ActiveRecord::Base
	has_many :product_variation_values
end
