class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_comments
  has_many :product_comments
  has_many :user_notifications
  has_many :orders
  has_many :user_cart_items
end
