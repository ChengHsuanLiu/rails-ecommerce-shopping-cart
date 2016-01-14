class ProductCommentsController < ApplicationController
	def create
		product_id = params[:product_id].to_i if params[:product_id].present?
    body = params[:body] if params[:body].present?
    rating = params[:rating].to_i if params[:body].present?
		@product = Product.find(product_id)
  	@product_comment = @product.product_comments.new
    @product_comment.body = body
    @product_comment.rating = rating



    respond_to do |format|
      if @product.save
        format.json { render json:
          {
            state: 'success',
            product_comment: @product_comment,
            redirect_url: product_path(@product)
          }
        }
    	else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
    	end
    end
	end

  private

  def product_comments_params
    params.require(:product_comment).permit(:body, :rating)
  end
end
