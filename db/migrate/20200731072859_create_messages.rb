class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user
      t.references :company
      t.references :room
      t.text :message, null: false

      t.timestamps
    end
  end
end
