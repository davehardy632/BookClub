class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.string :user
      t.string :description

      t.timestamps
    end
  end
end
