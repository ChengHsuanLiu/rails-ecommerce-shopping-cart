class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
		@recent_posts = Post.all.order('created_at DESC').limit(5)
		@post_categories = PostCategory.all
	end

	def show
		@post = Post.find(params[:id])
		@post_comments = @post.post_comments
		@recent_posts = Post.all.order('created_at DESC').limit(5)
		@post_categories = PostCategory.all
	end
end
