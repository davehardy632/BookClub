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

end
