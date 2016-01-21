class Admin::OrdersController < ApplicationController
	before_action :authenticate_user!
	before_action :get_shop_notifications, :only => :index
	layout 'admin'

  def index
    @orders = Order.includes(:user)
    #@keyword = "%" + params[:keyword] + "%" if params[:keyword].present?
    @orders = @orders.search(params[:keyword]) if params[:keyword].present?
  	@orders = @orders.page(params[:page]).per(1)
  end

  private

  def get_shop_notifications
    @shop_notifications = ShopNotification.all
  end
end
