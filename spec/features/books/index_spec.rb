require "rails_helper"

RSpec.describe "book_index", type: :feature do
  after :each do
    Review.destroy_all
    BookAuthor.destroy_all
    Book.destroy_all
    Author.destroy_all
  end
  it "user_can_see_all_books" do
    gaga = Author.create(name:"Lady Gaga")
    ted = Author.create(name:"Ted Bundy")
    book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg")
    review_1 = book_1.reviews.create(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
    review_2 = book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
    review_3 = book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
    review_4 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Frank", description: "This book was rad." )
    review_5 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
    review_6 = book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite." )
    review_7 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul." )
    review_8 = book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    review_9 = book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
    visit books_path

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Authors: #{gaga.name}")
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Year: #{book_1.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')

    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Authors: #{ted.name}")
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Year: #{book_2.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')

    expect(page).to have_content(book_3.title)
    expect(page).to have_content("Authors: #{gaga.name}")
    expect(page).to have_content("Pages: #{book_3.pages}")
    expect(page).to have_content("Year: #{book_3.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')
  end
  it 'book title is always a link' do
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

    visit books_path
      click_on "#{book_1.title}"
      expect(current_path).to eq(book_path(book_1))

    visit books_path
      click_on "#{book_2.title}"
      expect(current_path).to eq(book_path(book_2))

    visit books_path
      click_on "#{book_3.title}"
      expect(current_path).to eq(book_path(book_3))
    end

  it 'shows book statistics' do
    gaga = Author.create(name:"Lady Gaga")
    ted = Author.create(name:"Ted Bundy")
    book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
    # review_1 = book_1.reviews.create(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
    review_2 = book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
    review_3 = book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
    review_4 = book_2.reviews.create(title: "Review book 2", rating: 3, user: "Frank", description: "This book was rad." )
    review_5 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
    review_6 = book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "A compelling and will keep you guessing til the very end." )
    review_7 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul." )
    review_8 = book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    review_9 = book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
    review_10 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "David", description: "not A thrilling experience." )

    visit books_path

      within("#book-#{book_1.id}") do
        expect(page).to have_content("Average Rating: 2.0")
        expect(page).to have_content("Total Reviews: 2")
      end
      within("#book-#{book_2.id}") do
        expect(page).to have_content("Average Rating: 2.7")
        expect(page).to have_content("Total Reviews: 3")
      end
      within("#book-#{book_3.id}") do
        expect(page).to have_content("Average Rating: 3.0")
        expect(page).to have_content("Total Reviews: 4")
      end
    end
    it 'When I visit the book index page i can sort' do
      gaga = Author.create(name:"Lady Gaga")
      ted = Author.create(name:"Ted Bundy")
      book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
      book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
      book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
      # review_1 = book_1.reviews.create(title: "Review book 1", rating: 5, user: "John", description: "This book was upsetting." )
      review_2 = book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
      review_3 = book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
      review_4 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Frank", description: "This book was rad." )
      review_5 = book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
      review_6 = book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite." )
      review_7 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul." )
      review_8 = book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
      review_9 = book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
      review_10 = book_3.reviews.create(title: "Review book 3", rating: 3, user: "David", description: "not A thrilling experience." )

      visit books_path
      click_on "sort by rating asc"
      expect(page.all('.books')[0]).to have_content("#{book_1.title}")
      expect(page.all('.books')[1]).to have_content("#{book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{book_3.title}")
      click_on "sort by rating desc"
      expect(page.all('.books')[0]).to have_content("#{book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{book_1.title}")
      click_on "sort by pages asc"
      expect(page.all('.books')[0]).to have_content("#{book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{book_1.title}")
      expect(page.all('.books')[2]).to have_content("#{book_2.title}")
      click_on "sort by pages desc"
      expect(page.all('.books')[0]).to have_content("#{book_2.title}")
      expect(page.all('.books')[1]).to have_content("#{book_1.title}")
      expect(page.all('.books')[2]).to have_content("#{book_3.title}")
      click_on "sort by reviews desc"
      expect(page.all('.books')[0]).to have_content("#{book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{book_1.title}")
      click_on "sort by reviews asc"
      expect(page.all('.books')[0]).to have_content("#{book_1.title}")
      expect(page.all('.books')[1]).to have_content("#{book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{book_3.title}")
    end
  end
