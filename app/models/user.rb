class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :post_comments
  has_many :product_comments
  has_many :user_notifications
  has_many :orders

  has_many :user_cart_items
  has_many :products, through: :user_cart_items
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end
end
