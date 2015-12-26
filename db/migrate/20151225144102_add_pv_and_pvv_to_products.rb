class AddPvAndPvvToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_variation_id, :integer
    add_column :products, :product_variation_value_id, :integer
  end
end
