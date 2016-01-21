class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_shop_notifications, :only => [:index, :new, :edit]
	layout 'admin'

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
    @image = Image.new
    @images = Image.all
  end

  def create
  	@post = current_user.posts.new
    @post.title = params[:title].to_s
    @post.post_category_id = params[:post_category_id].to_i
    @post.is_draft = params[:is_draft]
    @post.visible = params[:visible]
    @post.body = params[:body]
    @post.feature_image_id = params[:feature_image_id].to_i

    respond_to do |format|
      if @post.save
        flash[:success] = "成功創建文章"
        format.json { render json:
          {
            state: 'success',
            redirect_url: edit_admin_post_path(@post)
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @post.errors.full_messages
          }
        }
      end
    end
  end

  def edit
  	@post = Post.find(params[:id])
    @image = Image.new
    @images = Image.all
  end

  def update
    @post = Post.find(params[:id].to_i)
    @post.update(posts_params)
    @post.update({title: params[:title].to_s, body: params[:body],
      post_category_id: params[:post_category_id].to_i, is_draft: params[:is_draft],
      visible: params[:visible],feature_image_id: params[:feature_image_id].to_i})

    respond_to do |format|
      if @post.save!
        flash[:success] = "成功儲存產品"
        format.json { render json:
          {
            state: 'success',
            redirect_url: edit_admin_post_path(@post)
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @post.errors.full_messages
          }
        }
      end
    end
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
    params.require(:post).permit(:title, :body, :post_category_id, :feature_image_id, :visible, :is_draft)
  end

  def get_shop_notifications
    @shop_notifications = ShopNotification.all
  end
end
