class Admin::PostsController < ApplicationController
	layout 'admin'

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(posts_params)
  	if @post.save
  		redirect_to admin_posts_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)

    redirect_to :action => :edit, :id => @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Post was successfully deleted.",
          post: @post
        }
      }
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
