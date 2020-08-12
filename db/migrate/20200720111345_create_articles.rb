class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :company_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false, limit: 4294967295
      t.string :image_id
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
