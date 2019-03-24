class Review < ApplicationRecord
  belongs_to :book

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
