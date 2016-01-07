class CreateUserCartItems < ActiveRecord::Migration
  def change
    create_table :user_cart_items do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity, :default => 1

      t.timestamps null: false
    end
  end
end
