require 'rails_helper'

RSpec.describe 'As a visitor' do
  after :each do
    Review.destroy_all
    BookAuthor.destroy_all
    Book.destroy_all
    Author.destroy_all
  end
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
  describe 'When I visit a books show page' do
    it 'shows all book field details' do
      author_1 = Author.create(name: 'JRR Tolkien')
      book_1 = author_1.books.create(title: 'Lord of The Rings', pages: 430, year: 1930, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")

      visit book_path(book_1)

      expect(page).to have_content(author_1.name)
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content(book_1.year)
      expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')
      #alt tag or css
    end

    it "shows a list of reviews and review data" do
      author_1 = Author.create(name: 'JRR Tolkien')
      book_1 = author_1.books.create(title: 'Lord of The Rings', pages: 430, year: 1930, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
      review = book_1.reviews.create(title: "Review 1", rating: 3, user: "John", description: "Lord of the rings is dank.")

      visit book_path(book_1)
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.user)
      expect(page).to have_content(review.description)
    end
  end
end


#
# I also see a list of reviews for that book.
# Each review will have a title and user, a numeric rating
# from 1 to 5, and text for the review itself, and all content
# must be present for each review.
