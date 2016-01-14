class ProductsController < ApplicationController
	def index
		@products = Product.where(is_child_product: false)
		@brands = Brand.all
	end

	def show
		@brands = Brand.all
		@product = Product.find(params[:id])
		@product_comments = @product.product_comments.page(params[:page]).per(5)
		@brands = Brand.all
		if @product.child_products.count > 0
			@child_products = @product.child_products
		end
	end
end
