class Admin::ProductsController < ApplicationController
	layout 'admin'

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(products_params)
  	if @product.save
  		redirect_to admin_products_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
	  @product = Product.find(params[:id])
	  @product.update(products_params)

	  redirect_to :action => :edit, :id => @product
	end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Product was successfully deleted.",
          product: @product
        }
      }
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :breif, :description, :list_price, :sale_price, :stock, :sku, :weight, :height, :length, :width, :is_multi_option, :public, :available, :brand_id, :is_child_product, :parent_product_id, :product_variation_id, :product_variation_value_id)
  end
end
