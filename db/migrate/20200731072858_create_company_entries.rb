class CreateCompanyEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :company_entries do |t|
      t.references :company, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
