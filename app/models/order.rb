class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_products
	has_many :products, through: :order_products

  def self.search(keyword)
    if keyword
      keyword = "%#{keyword}%"

      joins(:user).where('orders.id LIKE ? OR
             users.name LIKE ?', keyword, keyword)
    else
      scoped
    end
  end
end
