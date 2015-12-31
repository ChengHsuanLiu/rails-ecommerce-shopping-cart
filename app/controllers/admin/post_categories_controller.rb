class Admin::PostCategoriesController < ApplicationController
	layout 'admin'

  def index
  	@post_categories = PostCategory.all
  end

  def new
  	@post_category = PostCategory.new
  end

  def create
  	@post_category = PostCategory.new(post_categories_params)
  	if @post_category.save
  		redirect_to admin_post_categories_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@post_category = PostCategory.find(params[:id])
  end

  def update
    @post_category = PostCategory.find(params[:id])
    @post_category.update(post_categories_params)

    redirect_to :action => :edit, :id => @post_category
  end

  def destroy
    @post_category = PostCategory.find(params[:id])
    @post_category.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Post Category was successfully deleted.",
          post_category: @post_category
        }
      }
    end
  end

  private

  def post_categories_params
    params.require(:post_category).permit(:name)
  end
end
