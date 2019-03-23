class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors
  validates_uniqueness_of :title
  validates_presence_of :pages
  validates_presence_of :year

  def average_rating
    self.reviews.average(:rating)
  end

  def total_reviews
    self.reviews.count(:rating)
  end
end
