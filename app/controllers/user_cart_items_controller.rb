class UserCartItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@subtotal = 0
		@shipping_fee = 0
		@total_amount = 0
		@quantity_total = 0

		current_user.user_cart_items.each do |item|
			@subtotal = @subtotal + (item.product.sale_price * item.quantity)
			@quantity_total = @quantity_total + item.quantity
		end

		@total = @subtotal
		@user_cart_items = current_user.user_cart_items.includes(product: [:parent_products])
	end

  def create
  	product_id = params[:user_cart_item][:product_id] if params[:user_cart_item][:product_id].present?
  	quantity = params[:user_cart_item][:quantity].to_i if params[:user_cart_item][:quantity].present?

  	if current_user.user_cart_items.find_by(product_id: product_id).present?
	  	@user_cart_item = current_user.user_cart_items.find_by(product_id: product_id)
	  	@user_cart_item.quantity = @user_cart_item.quantity + quantity
	  	respond_to do |format|
	      if @user_cart_item.save
	        format.json { render json:
	          {
	            user_cart_item: @user_cart_item,
	            user_cart_item_count: current_user.user_cart_items.count
	          }
	        }
	      else
	        format.json {render json: { status: "failed" }}
	      end
	    end
	  else
	    @user_cart_item = current_user.user_cart_items.new(user_cart_item_params)
	    respond_to do |format|
	      if @user_cart_item.save
	        format.json { render json:
	          {
	            user_cart_item: @user_cart_item,
	            user_cart_item_count: current_user.user_cart_items.count
	          }
	        }
	      else
	        format.json {render json: { status: "failed" }}
	      end
	    end
	  end
  end

  def update_all
  	@user = current_user
  	user_cart_items = ActiveSupport::JSON.decode(params[:user_cart_items]) if params[:user_cart_items].present?
  	user_cart_items.each do |item|
  		@user_cart_item = @user.user_cart_items.find_by(id: item["id"].to_i)
  		@user_cart_item.update({ quantity: item["quantity"].to_i })
  	end

    respond_to do |format|
      if @user.save!
      	flash[:success] = '成功更新購物車'
        format.json { render json:
          {
            state: 'success',
            redirect_url: user_cart_items_path
          }
        }
    	else
        format.json { render json:
          {
            state: 'error',
            error: @user.errors.full_messages
          }
        }
    	end
    end
  end

  def destroy
    @user_cart_item = current_user.user_cart_items.find(params[:id])
    @user_cart_item.destroy
    redirect_to user_cart_items_path
  end

  private

  def user_cart_item_params
    params.require(:user_cart_item).permit(:user_id, :product_id, :quantity)
  end
end
