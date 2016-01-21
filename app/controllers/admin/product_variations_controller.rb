class Admin::ProductVariationsController < ApplicationController
	before_action :authenticate_user!
	layout 'admin'
end
