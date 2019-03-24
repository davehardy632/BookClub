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
    it 'links to show page when user is clicked' do
      author_1 = Author.create(name: 'JRR Tolkien')
      book_1 = author_1.books.create(title: 'Lord of The Rings', pages: 430, year: 1930, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
      review = book_1.reviews.create(title: "Review 1", rating: 3, user: "John", description: "Lord of the rings is dank.")

      visit book_path(book_1)

      click_on("#{review.user}")

      expect(current_path).to eq(user_path(review.user))
    end
  end
  describe 'when I visit a show page' do
    it 'can delete a book' do
      book = Book.create(title: "Book Title", pages: 354, year: 1976, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")

    visit book_path(book)

    click_on "Delete Book"

    expect(page).to_not have_content(book.title)
    expect(page).to_not have_content(book.pages)
    expect(page).to_not have_content(book.year)
    expect(page).to_not have_content(book.cover_image)
    end
  end
  describe 'when I visit a show page' do
    it 'shows statistics on reviews, top 3 rated, bottom 3, average rating' do
      book = Book.create(title: "The Silence of the Lambs", pages: 388, year: 1988, cover_image: "https://images-na.ssl-images-amazon.com/images/I/81jpy6NRw2L.jpg")
      review_1 = book.reviews.create(title: "Good book review", rating: 5, user: "Scott Glenn", description: "This book was hella scary.")
      review_2 = book.reviews.create(title: "Positive book review", rating: 5, user: "Ted Levine", description: "The movie wasn't this good.")
      review_3 = book.reviews.create(title: "Almost perfect book review", rating: 4, user: "Jodie Foster", description: "I liked the movie better.")
      review_4 = book.reviews.create(title: "Average book review", rating: 3, user: "Anthony Hopkins", description: "Disturbing and inappropriate.")
      review_5 = book.reviews.create(title: "Another average book review", rating: 3, user: "Brooke Smith", description: "Boring read.")
      review_6 = book.reviews.create(title: "Average book review again", rating: 3, user: "Anthony Heald", description: "This book was an unfortunate experience")
      review_7 = book.reviews.create(title: "Poor book review", rating: 2, user: "Diane Baker", description: "This book made me sad")
      review_8 = book.reviews.create(title: "Terrible book review", rating: 1, user: "Kasi Lemons", description: "This book was relatively bad")
      review_9 = book.reviews.create(title: "Worst book review", rating: 1, user: "Frankie Faison", description: "This book was not very gooe")

      visit book_path(book)

      expect(page).to have_content(review_1.title)
      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(review_1.user)
      expect(page).to have_content(review_2.title)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content(review_2.user)
      expect(page).to have_content(review_3.title)
      expect(page).to have_content(review_3.rating)
      expect(page).to have_content(review_3.user)

      expect(page).to have_content(review_7.title)
      expect(page).to have_content(review_7.rating)
      expect(page).to have_content(review_7.user)
      expect(page).to have_content(review_8.title)
      expect(page).to have_content(review_8.rating)
      expect(page).to have_content(review_8.user)
      expect(page).to have_content(review_9.title)
      expect(page).to have_content(review_9.rating)
      expect(page).to have_content(review_9.user)

      expect(page).to have_content("Average Rating: 3")
    end
  end
end

# As a Visitor,
# When I visit a book's show page,
# I see an area on the page for statistics about reviews:
# - the top three reviews for this book (title, rating and user only)
# - the bottom three reviews for this book  (title, rating and user only)
# - the overall average rating of all reviews for this book
