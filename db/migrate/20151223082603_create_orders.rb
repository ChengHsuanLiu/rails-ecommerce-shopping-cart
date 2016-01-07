class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total, :default => 0
      t.float :shipping_fee, :default => 0
      t.float :subtotal, :default => 0
      t.string :shipping_address
      t.string :bill_address
      t.string :shipping_phone
      t.string :shipping_name
      t.string :bill_phone
      t.string :bill_name
      t.integer :order_state_id

      t.timestamps null: false
    end
  end
end
