require 'rails_helper'

RSpec.describe 'As a Visitor' do

  describe 'When I visit a books show page' do
    it 'i see a link to add a new review for this book' do
      terry = Author.create(name:"Terry")
      book = terry.books.create(title:"Houses",pages:300, year:1984)
      visit book_path(book)

      expect(page).to have_content(book.title)

      visit new_book_review_path(book.id)

      fill_in :review_title, with: 'great'
      fill_in :review_user, with: 'tony'
      fill_in :review_rating, with: 4 #1 to 5
      fill_in :review_description, with: 'had to read it twice, it was so good'

      click_on "Create Review" #When the form is submitted, I should return to that book's

      expect(current_path).to eq(book_path(book))

      expect(page).to have_content('had to read it twice, it was so good')

    end
  end

  describe "When I visit a book's show page," do
    it "shows me one book title, author, pages, pub year, large image" do
      gaga = Author.create(name:"Lady Gaga")
      ted = Author.create(name:"Ted Bundy")
      book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
      book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
      book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
      visit book_path(book_1.id)


      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.year)
      expect(page).to have_content(gaga.name)
    end
  end
end
# I also see a list of reviews for that book.
# Each review will have a title and user, a numeric rating
# from 1 to 5, and text for the review itself, and all content
# must be present for each review.
