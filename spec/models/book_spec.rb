require "rails_helper"

describe Book, type: :model do
  after :each do
    Review.destroy_all
    BookAuthor.destroy_all
    Book.destroy_all
    Author.destroy_all
  end
  describe "Relationships" do
    it { should have_many :book_authors}
    it { should have_many(:authors).through(:book_authors) }
    it { should have_many :reviews }
  end

  describe 'instance methods' do

    it 'returns average book rating' do
    gaga = Author.create(name:"Lady Gaga")
    ted = Author.create(name:"Ted Bundy")
    book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
    review_1 = book_1.reviews.create(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
    review_2 = book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
    review_3 = book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
    review_4 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Frank", description: "This book was rad." )
    review_5 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
    review_6 = book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite." )
    review_7 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul." )
    review_8 = book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    review_9 = book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )


    actual = book_1.average_rating
    expect(actual).to eq(3.0)
    end
  end
end
