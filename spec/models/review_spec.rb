require "rails_helper"

describe Review, type: :model do
  before :each do
    @gaga = Author.create(name:"Lady Gaga")
    @ted = Author.create(name:"Ted Bundy")
    @jim = Author.create(name:"Jim Morrison")
    @book_1 = @gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    @book_2 = @ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    @book_3 = @gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    @book_4 = @jim.books.create(title: "Riders on the Storm", pages: 25, year: 1971, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    @book_5 = @jim.books.create(title: "Light My Fire", pages: 25, year: 1967, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    # review_1 = book_1.reviews.create(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
    @review_2 = @book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence.", created_at: 3.days.ago )
    @review_3 = @book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring.", created_at: 2.days.ago )
    @review_4 = @book_2.reviews.create(title: "a Review book 2", rating: 2, user: "Frank", description: "This book was rad.", created_at: 2.days.ago )
    @review_5 = @book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again.", created_at: 1.days.ago )
    @review_6 = @book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite.", created_at: 1.days.ago )
    @review_7 = @book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul.", created_at: 2.days.ago )
    @review_8 = @book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children.", created_at: 1.days.ago )
    @review_9 = @book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience.", created_at: 3.days.ago )
    @review_10 = @book_3.reviews.create(title: "Review book 3", rating: 3, user: "David", description: "not A thrilling experience.", created_at: 2.days.ago )
    @review_11 = @book_4.reviews.create(title: "Review book 4", rating: 5, user: "Joan", description: "yes, it was worth my time", created_at: 4.days.ago )
    @review_12 = @book_5.reviews.create(title: "Review book 5", rating: 5, user: "Joan", description: "loved it", created_at: 4.days.ago )
  end
  describe "Relationships" do
    it { should belong_to :book }
  end

  describe 'validations' do
    # it { should validate_uniqueness_of :user }

    # actual = Review.create(title: 'House of Leaves Review', description: 'It was good.', rating: 3, user: 'Bill')
    # expect(actual.user).to eq(actual.user.titleize)
  end
  describe 'class methods' do
    it 'can calc most active user' do
      actual = Review.most_active_user[0].user
      expect(actual).to eq(@review_9.user)
    end
    it 'can sort by the most recent review by the user' do
      actual = Review.most_recent('David')
      expect(actual).to eq([@review_6, @review_10, @review_9])
    end
    it 'can sort by the least recent review by the user' do
      actual = Review.least_recent('Jennica')
      expect(actual).to eq([@review_2, @review_8])
    end
    it 'can find all reviews for a user' do
      actual = Review.user('Jennica')
      expect(actual).to eq([@review_2, @review_8])
    end
    it 'can find the top 3 reviews' do
      actual = Review.top_three
      expect(actual).to eq([@review_11, @review_12, @review_6])
    end
    it 'can find the bottom 3 reviews' do
      actual = Review.bottom_three
      expect(actual).to eq([@review_3, @review_4, @review_5])
    end
  end
end
