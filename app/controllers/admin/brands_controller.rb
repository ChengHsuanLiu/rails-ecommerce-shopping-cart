class Admin::BrandsController < ApplicationController
	layout 'admin'

  def index
  	@brands = Brand.all
  end

  def new
  	@brand = Brand.new
  end

  def create
  	@brand = Brand.new(brands_params)
  	if @brand.save
  		redirect_to admin_brands_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(brands_params)

    redirect_to :action => :edit, :id => @brand
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Brand was successfully deleted.",
          brand: @brand
        }
      }
    end
  end

  private

  def brands_params
    params.require(:brand).permit(:name, :description)
  end
end
