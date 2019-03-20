require 'rails_helper'
RSpec.describe 'As a Visitor,' do
  before :each do
    @gaga = Author.create(name:"Lady Gaga")
    @ted = Author.create(name:"Ted Bundy")
    @book_1 = @gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    @book_2 = @ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    @book_3 = @gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
  end
  describe "When I visit a book's show page," do
    it "shows me one book title, author, pages, pub year, large image" do
      visit book_path(@book_1)

      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.pages)
      expect(page).to have_content(@book_1.year)
      expect(page).to have_content(@gaga.name)
    end
  end
end
# I also see a list of reviews for that book.
# Each review will have a title and user, a numeric rating
# from 1 to 5, and text for the review itself, and all content
# must be present for each review.
