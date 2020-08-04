class RenameAritcleIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :aritcle_id, :article_id
  end
end
