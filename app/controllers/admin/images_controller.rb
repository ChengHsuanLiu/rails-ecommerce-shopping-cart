class Admin::ImagesController < ApplicationController
	layout 'admin'

  def index
    @image = Image.new
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	@image = Image.create(images_params)
  end

  def edit
  	@image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update(images_params)

    redirect_to :action => :edit, :id => @image
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Image was successfully deleted.",
          image: @image
        }
      }
    end
  end

  private

  def images_params
    params.require(:image).permit(:image)
  end
end