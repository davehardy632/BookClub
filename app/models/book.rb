class Book < ApplicationRecord
  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors
  validates_uniqueness_of :title
  validates_presence_of :pages
  validates_presence_of :year

  def average_rating
    reviews.average(:rating)
  end

  def total_reviews
    self.reviews.count(:rating)
  end

  def top_three_reviews
    reviews.order(rating: :desc).limit(3)
  end
end
# Dog.order(age: :desc)	.order allows us to retrieve records ordered by specified attributes. :desc specifies descending order.
# Dog.limit(2)

# As a Visitor,
# When I visit a book's show page,
# I see an area on the page for statistics about reviews:
# - the top three reviews for this book (title, rating and user only)
# - the bottom three reviews for this book  (title, rating and user only)
# - the overall average rating of all reviews for this book
