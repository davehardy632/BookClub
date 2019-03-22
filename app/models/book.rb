class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_rating
    self.reviews.average(:rating)
  end

  def total_reviews
    self.reviews.count(:rating)
  end
end
