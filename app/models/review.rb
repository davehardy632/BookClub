class Review < ApplicationRecord
  belongs_to :book

  validates_numericality_of :rating
  validates_presence_of :user, :description, :rating, :title
end
