class Review < ApplicationRecord
  belongs_to :book

  validates_uniqueness_of :user
end
