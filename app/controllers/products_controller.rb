class ProductsController < ApplicationController
	def index
		@products = Product.where(is_child_product: false)
	end

	def show
		@product = Product.find(params[:id])
		if @product.child_products.count > 0
			@child_products = @product.child_products
		end
	end
end
