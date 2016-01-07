class CreateProductVariations < ActiveRecord::Migration
  def change
    create_table :product_variations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
