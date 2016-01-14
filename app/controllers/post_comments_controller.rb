class PostCommentsController < ApplicationController
	def create
		post_id = params[:post_id].to_i if params[:post_id].present?
    body = params[:body] if params[:body].present?
		@post = Post.find(post_id)
  	@post_comment = @post.post_comments.new
    @post_comment.body = body



    respond_to do |format|
      if @post.save
        format.json { render json:
          {
            state: 'success',
            post_comment: @post_comment,
            redirect_url: post_path(@post)
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

  private

  def post_comments_params
    params.require(:post_comment).permit(:body, :rating)
  end
end
