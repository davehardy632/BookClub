class Review < ApplicationRecord
  belongs_to :book

  validates_numericality_of :rating
  validates_presence_of :user, :description, :rating, :title


  def self.most_active_user
    Review.select('reviews.user, count(reviews.user) as num_reviews')
          .group(:user)
          .order('count(reviews.user) desc, reviews.user asc')
          .first(3)
  end

  def self.user(user)
    binding.pry
    Review.joins(:book)
          .select('reviews.*, books.cover_image, books.title as book_title')
          .where(user: user).entries
  end

  def self.most_recent(user)
    Review.joins(:book)
          .select('reviews.*, books.cover_image, books.title as book_title')
          .where(user: user)
          .order(created_at: :desc).entries
  end

  def self.least_recent(user)
    Review.joins(:book)
          .select('reviews.*, books.cover_image, books.title as book_title')
          .where(user: user)
          .order(created_at: :asc).entries
  end


  # def reviews_by_rating(book, direction)
  #    book.reviews.order(rating: direction).limit(3)
  #  end
  #
  # def avg_rating
  #   reviews.average(:rating)
  # end

  def self.top_three
    order(rating: :desc).limit(3)
  end

  def self.bottom_three
    order(rating: :asc).limit(3)
  end


end
