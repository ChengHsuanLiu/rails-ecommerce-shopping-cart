class Post < ActiveRecord::Base
	belongs_to :post_category
	belongs_to :user
	has_many :post_comments

	validates :title, :body, :user_id, :post_category_id, presence: true
  validates :visible, :inclusion => {:in => [true, false]}
  validates :is_draft, :inclusion => {:in => [true, false]}
end
