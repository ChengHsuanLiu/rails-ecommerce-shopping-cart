class ProductProductVariationValueShip < ActiveRecord::Base
	belongs_to :product
	belongs_to :product_variation_value
end
