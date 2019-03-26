require "rails_helper"

RSpec.describe "book_index", type: :feature do
  after :each do
    Review.destroy_all
    BookAuthor.destroy_all
    Book.destroy_all
    Author.destroy_all
  end
  describe 'shows all books by author' do
    it "shows title pages year and cover image" do
      author = Author.create(name: "Ken Follet")
      author_2 = Author.create(name: "Michael Crichton")

      book_1 = author.books.create(title: "Pillars of the Earth", pages: 1018, year: 1989, cover_image: "https://images.penguinrandomhouse.com/cover/9780451488336")
      author_2.books << book_1
      book_2 = author.books.create(title: "Fall of Giants", pages: 1008, year: 2010, cover_image: "https://lh3.googleusercontent.com/s2aOm9POj1EP-PPpXZOQ_OGyNbrjiFTFkCjtwwCXNmC0Ut94934u_Mu-NeIQ9HVPOExEz2qLMtg8ag=s400-rw")
      book_3 = author.books.create(title: "A Column of Fire", pages: 930, year: 2017, cover_image: "https://images-na.ssl-images-amazon.com/images/I/61Jhx0ST%2B7L._SX329_BO1,204,203,200_.jpg")

      visit author_path(author)

      expect(page).to have_content("#{author.name} Show Page")
      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_1.pages)
      expect(page).to have_content("Published in #{book_1.year}")
      expect(page).to have_css("#book-image-#{book_1.id}")
      expect(page).to have_content(book_2.title)
      expect(page).to have_content(book_2.pages)
      expect(page).to have_content("Published in #{book_2.year}")
      expect(page).to have_css("#book-image-#{book_2.id}")
      expect(page).to have_content(book_3.title)
      expect(page).to have_content(book_3.pages)
      expect(page).to have_content("Published in #{book_3.year}")
      expect(page).to have_css("#book-image-#{book_3.id}")

      within("#book-id-#{book_1.id}") do

        expect(page).to have_content("Michael Crichton")
        expect(page).to_not have_content("Ken Follet")
        end
      end
      xit 'books show highest rated review' do
      author = Author.create(name: "Ken Follet")
      author_2 = Author.create(name: "Michael Crichton")
      author_3 = Author.create(name: "Miguel Crichton")

      book_1 = author.books.create(title: "Pillars of the Earth", pages: 1018, year: 1989, cover_image: "https://images.penguinrandomhouse.com/cover/9780451488336")
      author_2.books << book_1
      book_2 = author.books.create(title: "Fall of Giants", pages: 1008, year: 2010, cover_image: "https://lh3.googleusercontent.com/s2aOm9POj1EP-PPpXZOQ_OGyNbrjiFTFkCjtwwCXNmC0Ut94934u_Mu-NeIQ9HVPOExEz2qLMtg8ag=s400-rw")
      book_3 = author.books.create(title: "A Column of Fire", pages: 930, year: 2017, cover_image: "https://images-na.ssl-images-amazon.com/images/I/61Jhx0ST%2B7L._SX329_BO1,204,203,200_.jpg")

      pillars_review_1 = book_1.reviews.create(title: "Pillars review 1", rating: 5, user: "John", description: "Wow what a great book, it was an emotional rollercoaster.")
      pillars_review_2 = book_1.reviews.create(title: "Pillars review 1", rating: 4, user: "Jessica", description: "pretty good book.")
      pillars_review_3 = book_1.reviews.create(title: "Pillars review 1", rating: 3, user: "Mark", description: "Middle of the road book.")
      giants_review_4 = book_2.reviews.create(title: "Giants review 1", rating: 5, user: "Nancy", description: "Amazing read!")
      giants_review_5 = book_2.reviews.create(title: "Giants review 2", rating: 4, user: "Joe", description: "it was a good book.")
      giants_review_6 = book_2.reviews.create(title: "Giants review 3", rating: 3, user: "Ted", description: "This book was ok.")
      fire_review_7 = book_3.reviews.create(title: "Fire review 1", rating: 5, user: "John", description: "Best book I have ever and will ever read.")
      fire_review_8 = book_3.reviews.create(title: "Fire review 2", rating: 4, user: "Bill", description: "Pretty good.")
      fire_review_9 = book_3.reviews.create(title: "Fire review 3", rating: 3, user: "Roy", description: "It passed the time at least.")

      visit author_path(author)


      expect(page).to have_content(pillars_review_1)
      expect(page).to have_content(giants_review_4)
      expect(page).to have_content(fire_review_7)
    end
    it 'I see a link on the page to delete the author' do
      author = Author.create(name: "Ken Follet")
      author_2 = Author.create(name: "Michael Crichton")

      book_1 = author.books.create(title: "Pillars of the Earth", pages: 1018, year: 1989, cover_image: "https://images.penguinrandomhouse.com/cover/9780451488336")
      book_1.authors << author_2
      # author_2.books << book_1
      book_2 = author.books.create(title: "Fall of Giants", pages: 1008, year: 2010, cover_image: "https://lh3.googleusercontent.com/s2aOm9POj1EP-PPpXZOQ_OGyNbrjiFTFkCjtwwCXNmC0Ut94934u_Mu-NeIQ9HVPOExEz2qLMtg8ag=s400-rw")
      book_3 = author.books.create(title: "A Column of Fire", pages: 930, year: 2017, cover_image: "https://images-na.ssl-images-amazon.com/images/I/61Jhx0ST%2B7L._SX329_BO1,204,203,200_.jpg")
      book_4 = author_2.books.create(title: "A New Book by author2", pages: 122, year: 2019, cover_image: "https://images-na.ssl-images-amazon.com/images/I/61Jhx0ST%2B7L._SX329_BO1,204,203,200_.jpg")

      pillars_review_1 = book_1.reviews.create(title: "Pillars review 1", rating: 5, user: "John", description: "Wow what a great book, it was an emotional rollercoaster.")

      visit author_path(author.id)

      within "#book-id-#{book_1.id}" do
        click_on "Delete Author"
      end

      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(author.name)
      expect(page).to_not have_content(book_3.title)
      expect(page).to_not have_content(book_2.title)
      expect(page).to_not have_content(pillars_review_1.title)
      expect(page).to have_content(author_2.name)
    end
  end
end
