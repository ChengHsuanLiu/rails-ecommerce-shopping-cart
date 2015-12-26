class CreateProductVariations < ActiveRecord::Migration
  def change
    create_table :product_variations do |t|
      t.string :name
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
