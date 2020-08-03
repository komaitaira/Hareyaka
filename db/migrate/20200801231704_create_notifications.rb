class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user
      t.references :company
      t.references :room
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
