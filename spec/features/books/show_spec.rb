require 'rails_helper'
RSpec.describe 'As a Visitor' do
  before :each do
    @terry = Author.create(name:"Terry")
    @book = @terry.books.create(title:"Houses",pages:300, year:1984)

  end
  describe 'When I visit a books show page' do
    xit 'i see a link to add a new review for this book' do
      visit book_path(@book)

      expect(page).to have_content(@book.title)

      visit new_book_review_path(@book.id)

      fill_in :review_title, with: 'great'
      fill_in :review_user, with: 'tony'
      fill_in :review_rating, with: 4 #1 to 5
      fill_in :review_description, with: 'had to read it twice, it was so good'

      click_on "Create Review" #When the form is submitted, I should return to that book's

      expect(current_path).to eq(book_path(@book))

      expect(page).to have_content('had to read it twice, it was so good')

    end
  end
end
