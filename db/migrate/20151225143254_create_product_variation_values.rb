class CreateProductVariationValues < ActiveRecord::Migration
  def change
    create_table :product_variation_values do |t|
      t.string :name
      t.integer :product_variation_id

      t.timestamps null: false
    end
  end
end
