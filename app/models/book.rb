class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  validates_uniqueness_of :title
  validates_presence_of :pages
  validates_presence_of :year

  def average_rating
    if self.reviews.any?
      self.reviews.average(:rating).round(1)
    end
  end

  def total_reviews
    self.reviews.count(:rating)
  end

  def top_three_reviews
    reviews.order(rating: :desc).limit(3)
  end

  def top_review
    reviews.order(rating: :desc).limit(1)
  end

  def return_authors(author)
    authors.where.not(id: author.id)
  end

  def self.sort_pages(order)
    Book.order(pages: :"#{order}")
  end

  def self.sort_reviews(order)
    Book.left_outer_joins(:reviews)
        .select('count(reviews.rating)as total_reviews, books.*')
        .group('books.id')
        .order("count(reviews.rating) #{order}")
  end

  def self.sort_rating(order)
    Book.left_outer_joins(:reviews)
        .select('books.*, coalesce(avg(reviews.rating),0) as avg_rating')
        .group('books.id')
        .order("coalesce(avg(reviews.rating),0) #{order}")
  end

  def self.highest_rated
    Book.joins(:reviews)
        .select('books.title,avg(reviews.rating) as avg_rating')
        .group(:title)
        .order('avg(reviews.rating) desc')
        .first(3)
  end

  def self.lowest_rated
    Book.joins(:reviews)
        .select('books.title,avg(reviews.rating) as avg_rating')
        .group(:title)
        .order('avg(reviews.rating)')
        .first(3)
  end
end
