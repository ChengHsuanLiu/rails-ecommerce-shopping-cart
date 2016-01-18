class OrdersController < ApplicationController
	before_action :authenticate_user!

	def index
		@orders = current_user.orders.order('created_at DESC')
	end

	def show
		@order = Order.find(params[:id])
		if current_user.id != @order.user.id
			flash[:error] = "您沒有權限進入此頁面"
			redirect_to orders_path
		end
	end

  def new
    @order = current_user.orders.new
  end

  def create
		@order = current_user.orders.new(orders_params)
		@order.subtotal = 0
		@order.shipping_fee = 0
		@order.total = 0
		quantity_total = 0

		current_user.user_cart_items.each do |item|
			@product = Product.find(item.product_id)
			if @product.parent_products.first
				@product = @product.parent_products.first
			end
			@order_product = @order.order_products.new
			@order_product.quantity = item.quantity
			@order_product.product_id = item.product_id


			@order_product.price = item.product.sale_price
			@order.subtotal = @order.subtotal + (item.quantity * item.product.sale_price)


			quantity_total = quantity_total + item.quantity
		end

		@order.total = @order.subtotal + @order.shipping_fee

		if @order.save
			current_user.user_cart_items.each do |item|
				@product = Product.find(item.product_id)
				@product.stock = @product.stock - item.quantity
			end
			current_user.user_cart_items.destroy_all
			redirect_to @order
		else
			render 'new'
		end
  end

  private

  def orders_params
    params.require(:order).permit(:subtotal, :total, :shipping_fee, :bill_name, :bill_address, :bill_phone, :order_state_id, :shipping_address, :shipping_phone, :shipping_name, :special_note)
  end
end
