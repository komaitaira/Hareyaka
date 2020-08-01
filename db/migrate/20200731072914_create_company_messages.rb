class CreateCompanyMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :company_messages do |t|
      t.references :company, foreign_key: true
      t.references :room, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
