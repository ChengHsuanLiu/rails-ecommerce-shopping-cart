class AddSpecialNoteToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :special_note, :text
  end
end
