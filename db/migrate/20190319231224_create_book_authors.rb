class CreateBookAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :book_authors do |t|
      t.references :book, foreign_key: true
      t.references :authors, foreign_key: true

      t.timestamps
    end
  end
end
