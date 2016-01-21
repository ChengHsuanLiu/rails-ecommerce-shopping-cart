class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	before_action :get_shop_notifications, :only => :index
	layout 'admin'

  def index

  end

  private

  def get_shop_notifications
    @shop_notifications = ShopNotification.all
  end
end
