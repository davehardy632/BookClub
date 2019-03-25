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
  describe 'validations' do
    it { should validate_uniqueness_of :title}
    it { should validate_presence_of :pages}
    it { should validate_presence_of :year}
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
    it 'returns all other authors' do
      author = Author.create(name: "Ken Follet")
      author_2 = Author.create(name: "Michael Crichton")

      book_1 = author.books.create!(title: "Pillars of the Earth", pages: 1018, year: 1989, cover_image: "https://images.penguinrandomhouse.com/cover/9780451488336")
      author_2.books << book_1
      book_2 = author.books.create!(title: "Fall of Giants", pages: 1008, year: 2010, cover_image: "https://lh3.googleusercontent.com/s2aOm9POj1EP-PPpXZOQ_OGyNbrjiFTFkCjtwwCXNmC0Ut94934u_Mu-NeIQ9HVPOExEz2qLMtg8ag=s400-rw")
      book_3 = author.books.create!(title: "A Column of Fire", pages: 930, year: 2017, cover_image: "https://images-na.ssl-images-amazon.com/images/I/61Jhx0ST%2B7L._SX329_BO1,204,203,200_.jpg")

      actual = book_1.return_authors(author)
      expected = [author_2]

      expect(actual).to eq(expected)

    end
  end
end
