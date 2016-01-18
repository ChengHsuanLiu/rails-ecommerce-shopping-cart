class Admin::UsersController < ApplicationController
	layout 'admin'

  def index
  	@users = User.all
    @keyword = "%" + params[:keyword] + "%" if params[:keyword].present?
    @users = @users.where("name LIKE ? OR email LIKE ? OR id LIKE ?", @keyword, @keyword, @keyword) if params[:keyword].present? && params[:keyword] != '' && params[:keyword] != 'undefined'
  	@users = @users.page(params[:page]).per(1)
  end
end
