class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :breif
      t.text :description
      t.float :list_price
      t.float :sale_price
      t.integer :stock
      t.string :sku
      t.float :weight
      t.float :height
      t.float :length
      t.float :width
      t.boolean :is_multi_option
      t.boolean :public
      t.boolean :available
      t.integer :brand_id

      t.timestamps null: false
    end
  end
end
