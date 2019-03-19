class RemoveAuthors < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :authors
  end
end
