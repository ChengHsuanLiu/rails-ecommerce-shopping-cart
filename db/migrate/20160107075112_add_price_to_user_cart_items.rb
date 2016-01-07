class AddPriceToUserCartItems < ActiveRecord::Migration
  def change
    add_column :user_cart_items, :price, :float
  end
end
