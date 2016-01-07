class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :brief
      t.text :description
      t.float :list_price
      t.float :sale_price
      t.integer :stock, :default => 1
      t.string :sku
      t.float :weight
      t.float :height
      t.float :length
      t.float :width
      t.boolean :is_multi_option, :default => false
      t.boolean :visible, :default => true
      t.boolean :available, :default => true
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
