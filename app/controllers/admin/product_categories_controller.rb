class Admin::ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shop_notifications, :only => [:index, :new, :edit]
	layout 'admin'

  def index
  	@product_categories = ProductCategory.all
  end

  def new
  	@product_category = ProductCategory.new
  end

  def create
  	@product_category = ProductCategory.new(product_categories_params)
  	if @product_category.save
  		redirect_to admin_product_categories_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    @product_category.update(product_categories_params)

    redirect_to :action => :edit, :id => @product_category
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Product Category was successfully deleted.",
          product_category: @product_category
        }
      }
    end
  end

  private

  def product_categories_params
    params.require(:product_category).permit(:name)
  end

  def get_shop_notifications
    @shop_notifications = ShopNotification.all
  end
end
