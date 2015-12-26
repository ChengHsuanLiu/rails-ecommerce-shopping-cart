class Post < ActiveRecord::Base
	belongs_to :post_category
	has_many :post_comments
end
