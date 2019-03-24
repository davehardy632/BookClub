class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  def average_rating
    if self.reviews.any?
      self.reviews.average(:rating).round(1)
    end
  end

  def total_reviews
    self.reviews.count(:rating)
  end
end
