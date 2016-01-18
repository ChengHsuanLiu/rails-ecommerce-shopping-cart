class Admin::OrdersController < ApplicationController
	layout 'admin'

  def index
  	@orders = Order.all
  	@orders = @orders.page(params[:page]).per(1)
  end
end
