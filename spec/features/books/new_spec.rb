require 'rails_helper'

RSpec.describe 'I can fill in a form and add a new book' do
  it 'fills in title, pages, book cover image, authors' do
    # gaga = Author.create(name:"Lady Gaga")
    new_book = Book.create(title: "new book", pages: 320, year: 1993, cover_image: "https://content.linkedin.com/content/dam/business/marketing-solutions/global/en_US/blog/2017/02/ClassicBook810Header.jpg")
    review = new_book.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
    review_2 = new_book.reviews.create(title: "Review book 4", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    name = 'gaga'
    name_2 = 'john'

    names = "gaga, john"

    visit new_book_path

    fill_in "book[title]", with: new_book.title
    fill_in "book[pages]", with: new_book.pages
    fill_in "book[year]", with: new_book.year
    fill_in "book[cover_image]", with: new_book.cover_image
    fill_in "authors[name]", with: names
    click_on 'Submit'

    updated_book = Book.last

    expect(page).to have_content(updated_book.title.titleize)
    expect(page).to have_content(updated_book.pages)
    expect(page).to have_content(updated_book.year)
    expect(page).to have_css("img[src*='#{updated_book.cover_image}']")
    expect(page).to have_content(name.titleize)
  end
  it 'fills in default image' do
    # gaga = Author.create(name:"Lady Gaga")
    new_book = Book.create(title: "new book", pages: 320, year: 1993)
    review = new_book.reviews.create(title: "Review book 3", rating: 4, user: "David", description: "A thrilling experience." )
    review_2 = new_book.reviews.create(title: "Review book 4", rating: 2, user: "Jennica", description: "Dont read this book to your children." )
    name = 'gaga'
    name_2 = 'john'
    names = "gaga, john"
    default = "https://historyexplorer.si.edu/sites/default/files/book-158.jpg"

    visit new_book_path

    fill_in "book[title]", with: new_book.title
    fill_in "book[pages]", with: new_book.pages
    fill_in "book[year]", with: new_book.year
    # fill_in "book[cover_image]", with:
    fill_in "authors[name]", with: names
    click_on 'Submit'

    updated_book = Book.last

    expect(page).to have_content(updated_book.title.titleize)
    expect(page).to have_content(updated_book.pages)
    expect(page).to have_content(updated_book.year)
    expect(page).to have_css("img[src*='#{default}']")
    expect(page).to have_content(name.titleize)
  end
end
