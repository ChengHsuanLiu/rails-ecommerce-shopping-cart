class CreateProductChildProducts < ActiveRecord::Migration
  def change
    create_table :product_child_products do |t|
      t.integer :product_id
      t.integer :child_product_id

      t.timestamps null: false
    end

    add_index :product_child_products, :product_id
    add_index :product_child_products, :child_product_id
  end
end
