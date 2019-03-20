require "rails_helper"

RSpec.describe "book_index", type: :feature do
  it "user_can_see_all_books" do
    gaga = Author.create(name:"Lady Gaga")
    ted = Author.create(name:"Ted Bundy")
    book_1 = gaga.books.create(title: "Book 1", pages: 300, year: 1973, cover_image: "www.book.com")
    book_2 = ted.books.create(title: "Book 2", pages: 340, year: 1988, cover_image: "www.book.com")
    book_3 = gaga.books.create(title: "Book 3", pages: 200, year: 1971, cover_image: "www.book.com")

    visit "/books"

    expect(page).to have_content(book_1.title)
    expect(page).to have_content("Authors: #{gaga.name}")
    expect(page).to have_content("Pages: #{book_1.pages}")
    expect(page).to have_content("Year: #{book_1.year}")
    expect(page).to have_content(book_1.cover_image)

    expect(page).to have_content(book_2.title)
    expect(page).to have_content("Authors: #{ted.name}")
    expect(page).to have_content("Pages: #{book_2.pages}")
    expect(page).to have_content("Year: #{book_2.year}")
    expect(page).to have_content(book_2.cover_image)

    expect(page).to have_content(book_3.title)
    expect(page).to have_content("Authors: #{gaga.authors}")
    expect(page).to have_content("Pages: #{book_3.pages}")
    expect(page).to have_content("Year: #{book_3.year}")
    expect(page).to have_content(book_3.cover_image)
  end
end
