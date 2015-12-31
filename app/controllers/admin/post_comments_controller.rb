class Admin::PostCommentsController < ApplicationController
	layout 'admin'

  def index
  	@post_comments = PostComment.all
  end
end
