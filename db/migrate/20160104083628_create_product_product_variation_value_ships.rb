class CreateProductProductVariationValueShips < ActiveRecord::Migration
  def change
    create_table :product_product_variation_value_ships do |t|
      t.integer :product_id
      t.integer :product_variation_value_id

      t.timestamps null: false
    end
  end
end
