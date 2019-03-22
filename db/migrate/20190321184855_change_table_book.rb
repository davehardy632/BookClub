class ChangeTableBook < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :cover_image, :string, :default => "https://historyexplorer.si.edu/sites/default/files/book-158.jpg"
  end
end
