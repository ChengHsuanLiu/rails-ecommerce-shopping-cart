class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :body
      t.integer :rating, :default => 1

      t.timestamps null: false
    end
  end
end
