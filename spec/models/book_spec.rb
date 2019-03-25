require "rails_helper"

RSpec.describe Book, type: :model do
  before :each do
    @gaga = Author.create(name:"Lady Gaga")
    @ted = Author.create(name:"Ted Bundy")
    @book_1 = @gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    @book_2 = @ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    @book_3 = @gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
    @review_1 = @book_1.reviews.create!(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
    @review_2 = @book_1.reviews.create!(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
    @review_3 = @book_1.reviews.create!(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
    @review_4 = @book_2.reviews.create!(title: "Review book 2", rating: 2, user: "Frank", description: "This book was rad." )
    @review_5 = @book_2.reviews.create!(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
    @review_6 = @book_2.reviews.create!(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite." )
    @review_7 = @book_3.reviews.create!(title: "Review book 3", rating: 0, user: "Toby", description: "This book was a journey into the depths of my soul." )
    @review_8 = @book_3.reviews.create!(title: "Review book 3", rating: 0, user: "Jennica", description: "Dont read this book to your children." )
    @review_9 = @book_2.reviews.create!(title: "Review book 2", rating: 0, user: "David", description: "A thrilling experience." )
  end
  describe "Relationships" do
    it { should have_many :book_authors}
    it { should have_many(:authors).through(:book_authors) }
    it { should have_many :reviews }
  end

  describe 'instance methods' do
    it 'returns average book rating' do
      actual = @book_1.average_rating
      expect(actual).to eq(3.0)
    end
    it 'returns avg book rating - sad path' do
      actual = @book_3.average_rating
      expect(actual).to eq(0.0)
    end
    it 'can calc total_reviews' do
      actual = @book_1.total_reviews
      expect(actual).to eq(3)
    end
  end
  describe 'class methods' do
    it 'can sort by avg rating asc' do
      actual = Book.sort_rating('asc')
      expect(actual).to eq([@book_3, @book_2, @book_1])
    end
    it 'can sort by avg rating desc' do
      actual = Book.sort_rating('desc')
      expect(actual).to eq([@book_1, @book_2, @book_3])
    end
    it 'can sort by total reviews asc' do
      actual = Book.sort_reviews('asc')
      expect(actual).to eq([@book_3, @book_1, @book_2])
    end
    it 'can sort by total reviews desc' do
      actual = Book.sort_reviews('desc')
      expect(actual).to eq([@book_2, @book_1, @book_3])
    end
    it 'can sort by pages asc' do
      actual = Book.sort_pages('asc')
      expect(actual).to eq([@book_3, @book_1, @book_2])
    end
    it 'can sort by pages desc' do
      actual = Book.sort_pages('desc')
      expect(actual).to eq([@book_2, @book_1, @book_3])
    end

    it 'can find the highest rated books' do
      actual = Book.highest_rated[0].title
      expect(actual).to eq(@book_1.title)
    end
    it 'can find the lowest rated books' do
      actual = Book.lowest_rated[0].title
      expect(actual).to eq(@book_3.title)

    describe 'validations' do
      it { should validate_uniqueness_of :title}
      it { should validate_presence_of :pages}
      it { should validate_presence_of :year}
      end

    end
  end
