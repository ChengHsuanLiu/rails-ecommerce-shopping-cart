class AddChildProductValuesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :is_child_product, :boolean, :default => false
    add_column :products, :parent_product_id, :integer
  end
end
