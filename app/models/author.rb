class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors, dependent: :destroy
  validates_uniqueness_of :name
end
# objects_array.sort_by{ |obj| obj.attribute }
