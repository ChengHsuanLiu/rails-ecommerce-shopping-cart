class ProductComment < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :body, :rating, presence: true
end
