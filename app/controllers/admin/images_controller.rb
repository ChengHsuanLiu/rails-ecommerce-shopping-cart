class Admin::ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shop_notifications, :only => [:index, :new, :edit]
	layout 'admin'

  def index
    @image = Image.new
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def get_image_url
    image_id = params[:image_id].to_i if params[:image_id].present?
    @image = Image.find(image_id)
    @image_url = @image.image_url

    respond_to do |format|
      format.json { render json:
        {
          state: 'success',
          image_url: @image_url
        }
      }
    end
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

  def get_shop_notifications
    @shop_notifications = ShopNotification.all
  end
end
