class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.integer :pages
      t.integer :year
      t.string :cover_image

      t.timestamps
    end
  end
end
