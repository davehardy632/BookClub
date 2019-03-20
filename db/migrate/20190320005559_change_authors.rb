class ChangeAuthors < ActiveRecord::Migration[5.1]
  def change
    rename_column :book_authors, :authors_id, :author_id
  end
end
