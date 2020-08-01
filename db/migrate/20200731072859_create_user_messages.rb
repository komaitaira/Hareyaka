class CreateUserMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_messages do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
