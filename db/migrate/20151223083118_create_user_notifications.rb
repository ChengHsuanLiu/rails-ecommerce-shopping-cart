class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.integer :user_id
      t.text :body
      t.string :url
      t.boolean :is_read

      t.timestamps null: false
    end
  end
end
