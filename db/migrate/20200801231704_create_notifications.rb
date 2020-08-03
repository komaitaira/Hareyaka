class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.string :receiver_class
      t.string :sender_class
      t.string :action
      t.references :room
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
