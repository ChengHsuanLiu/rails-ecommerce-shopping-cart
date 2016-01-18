class AddFeatureImageIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :feature_image_id, :integer
  end
end
