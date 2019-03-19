require "rails_helper"

RSpec.describe "book_index", type: :feature do
  it "user_can_see_all_books" do
    book_1 = Book.create(title: "Book 1", authors: "Lady Gaga", pages: 300, year: 1973, cover_image: "www.book.com")
    book_2 = Book.create(title: "Book 2", authors: "Ted Bundy", pages: 340, year: 1988, cover_image: "www.book.com")
    book_3 = Book.create(title: "Book 3", authors: "Lady Gaga", pages: 200, year: 1971, cover_image: "www.book.com")

    visit "/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Authors: #{book_1.authors}")
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Year: #{book_1.year}")
    expect(page).to have_content(book_1.cover_image)

    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Authors: #{book_2.authors}")
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Year: #{book_2.year}")
    expect(page).to have_content(book_2.cover_image)

    expect(page).to have_content(book_3.title)
    expect(page).to have_content("Authors: #{book_3.authors}")
    expect(page).to have_content("Pages: #{book_3.pages}")
    expect(page).to have_content("Year: #{book_3.year}")
    expect(page).to have_content(book_3.cover_image)
  end
end
