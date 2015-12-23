class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.string :name
      t.string :value
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
