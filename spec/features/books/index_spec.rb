require "rails_helper"

RSpec.describe "book_index", type: :feature do
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
    @review_2 = @book_1.reviews.create(title: "Review book 1", rating: 3, user: "Jennica", description: "This book was pretty cool, but I wish it had more violence." )
    @review_3 = @book_1.reviews.create(title: "Review book 1", rating: 1, user: "Larry", description: "This book was boring." )
    @review_4 = @book_2.reviews.create(title: "Review book 2", rating: 2, user: "Frank", description: "This book was rad." )
    @review_5 = @book_2.reviews.create(title: "Review book 2", rating: 2, user: "Willy Wonka", description: "This book was stupid, but I would read it again." )
    @review_6 = @book_2.reviews.create(title: "Review book 2", rating: 4, user: "David", description: "This book was my favorite." )
    @review_7 = @book_3.reviews.create(title: "Review book 3", rating: 3, user: "Toby", description: "This book was a journey into the depths of my soul." )
    @review_8 = @book_3.reviews.create(title: "Review book 3", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    @review_9 = @book_3.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
    @review_10 = @book_3.reviews.create(title: "Review book 3", rating: 3, user: "David", description: "not A thrilling experience." )
    @review_11 = @book_4.reviews.create(title: "Review book 4", rating: 5, user: "Joan", description: "yes, it was worth my time" )
    @review_12 = @book_5.reviews.create(title: "Review book 5", rating: 5, user: "Joan", description: "loved it" )
  end
  it "user_can_see_all_books" do
    visit books_path

    expect(page).to have_content(@book_1.title)
    expect(page).to have_content("Authors: #{@gaga.name}")
    expect(page).to have_content("Pages: #{@book_1.pages}")
    expect(page).to have_content("Year: #{@book_1.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')

    expect(page).to have_content(@book_2.title)
    expect(page).to have_content("Authors: #{@ted.name}")
    expect(page).to have_content("Pages: #{@book_2.pages}")
    expect(page).to have_content("Year: #{@book_2.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')

    expect(page).to have_content(@book_3.title)
    expect(page).to have_content("Authors: #{@gaga.name}")
    expect(page).to have_content("Pages: #{@book_3.pages}")
    expect(page).to have_content("Year: #{@book_3.year}")
    expect(page).to have_xpath('//img[@src="https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg"]')
  end
  it "author names are all links" do
    visit books_path

    within("#book-#{@book_1.id}") do
    expect(page).to have_link(@gaga.name)
    end
    within("#book-#{@book_2.id}") do
    expect(page).to have_link(@ted.name)
    end
    within("#book-#{@book_3.id}") do
    expect(page).to have_link(@gaga.name)
    end
    within("#book-#{@book_4.id}") do
    expect(page).to have_link(@jim.name)
    end
    within("#book-#{@book_5.id}") do
    expect(page).to have_link(@jim.name)
    end
  end
  it 'book title is always a link' do
    visit books_path
      click_on "#{@book_1.title}"
      expect(current_path).to eq(book_path(@book_1))

    visit books_path
      click_on "#{@book_2.title}"
      expect(current_path).to eq(book_path(@book_2))

    visit books_path
      click_on "#{@book_3.title}"
      expect(current_path).to eq(book_path(@book_3))
    end

  it 'shows book statistics' do

    gaga = Author.create!(name:"Lady")
    ted = Author.create!(name:"Ted")
    book_1 = gaga.books.create(title: "rev Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    book_2 = ted.books.create(title: "rev Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    book_3 = gaga.books.create(title: "rev Book 3", pages: 200, year: 1971, cover_image: "www.book.com")
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

      within("#book-#{@book_1.id}") do
        expect(page).to have_content("Average Rating: 2.0")
        expect(page).to have_content("Total Reviews: 2")
      end
      within("#book-#{@book_2.id}") do
        expect(page).to have_content("Average Rating: 2.7")
        expect(page).to have_content("Total Reviews: 3")
      end
      within("#book-#{@book_3.id}") do
        expect(page).to have_content("Average Rating: 3.0")
        expect(page).to have_content("Total Reviews: 4")
      end
    end
    it 'When I visit the book index page i can sort' do

      visit books_path
      click_on "sort by rating asc"
      expect(page.all('.books')[0]).to have_content("#{@book_1.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_3.title}")
      click_on "sort by rating desc"
      expect(page.all('.books')[0]).to have_content("#{@book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_1.title}")
      click_on "sort by pages asc"
      expect(page.all('.books')[0]).to have_content("#{@book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_1.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_2.title}")
      click_on "sort by pages desc"
      expect(page.all('.books')[0]).to have_content("#{@book_2.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_1.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_3.title}")
      click_on "sort by reviews desc"
      expect(page.all('.books')[0]).to have_content("#{@book_3.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_1.title}")
      click_on "sort by reviews asc"
      expect(page.all('.books')[0]).to have_content("#{@book_1.title}")
      expect(page.all('.books')[1]).to have_content("#{@book_2.title}")
      expect(page.all('.books')[2]).to have_content("#{@book_3.title}")
    end
    it 'I see an area showing statistics about all books' do
      visit books_path
      within("#statistics") do
        expect(page).to have_content("Highest Rated Books: #{@book_4.title}: 5.0 #{@book_5.title}: 5.0 #{@book_3.title}: 3.0")
        expect(page).to have_content("Lowest Rated Books: #{@book_1.title}: 2.0 #{@book_2.title}: 2.7 #{@book_3.title}: 3.0")
        expect(page).to have_content("Most Active Users: David: 3 Jennica: 2 Joan: 2")
      end
    end
  end
