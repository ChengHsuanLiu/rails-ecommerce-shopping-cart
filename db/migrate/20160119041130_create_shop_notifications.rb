class CreateShopNotifications < ActiveRecord::Migration
  def change
    create_table :shop_notifications do |t|
      t.text :body
      t.string :url
      t.boolean :is_read
      t.string :category

      t.timestamps null: false
    end
  end
end
