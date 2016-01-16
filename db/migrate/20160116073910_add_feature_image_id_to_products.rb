class AddFeatureImageIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :feature_image_id, :integer
  end
end
