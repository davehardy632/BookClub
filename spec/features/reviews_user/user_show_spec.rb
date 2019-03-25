require 'rails_helper'

RSpec.describe 'as a visitor' do
  before :each do
    @mark = Author.create(name: 'Mark Z. Danielewski' )
    @terry = Author.create(name: 'Terry Pratchett' )
    @neil = Author.create(name: 'Neil Gaiman')
    @leaves = @mark.books.create(title: 'House of Leaves', pages: 709, year: 2000)
    @omens = Book.create(title: 'Good Omens', pages: 288, year: 1990, authors: [@terry, @neil])

    # @r3 = Review.create!(title: 'Good Omens Review', description: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Good Omens'), user: 'Bill', created_at: 1.day.ago)
    # @r1 = Review.create!(title: 'House of Leaves Review', description: 'It was good.', rating: 3, book: Book.find_by(title: 'House of Leaves'), user: 'Bill', created_at: 3.days.ago)
    # @r2 = Review.create!(title: 'House of Leaves Review 2', description: 'It was great.', rating: 4, book: Book.find_by(title: 'House of Leaves'), user: 'Sandy')

    @knight = Book.create(title: 'Hard Knight', pages: 288, year: 1990, authors: [@mark])
    @r1 = Review.create(title: 'House of Leaves Review', description: 'It was good.', rating: 3, book: Book.find_by(title: 'House of Leaves'), user: 'Bill', created_at: 1.days.ago)
    @r2 = Review.create(title: 'House of Leaves Review 2', description: 'It was great.', rating: 4, book: Book.find_by(title: 'House of Leaves'), user: 'Sandy', created_at: 2.days.ago)
    @r3 = Review.create(title: 'Good Omens Review', description: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Good Omens'), user: 'Bill', created_at: 3.days.ago)
    @r4 = Review.create(title: 'Good Omens Review', description: 'It was amazing.', rating: 5, book: Book.find_by(title: 'Hard Knight'), user: 'Bill', created_at: 4.days.ago)
  end

  describe 'when i visit the user show page' do
    it 'shows all reviews written by that user' do
      visit user_path('Bill')
      expect(page).to have_content(@r1.title)
      expect(page).to_not have_content(@r2.title)
      expect(page).to have_content(@r1.rating)
      expect(page).to_not have_content("Rating: #{@r2.rating}")
      expect(page).to have_content(@r1.description)
      expect(page).to_not have_content(@r2.description)
      expect(page).to have_content(@r1.created_at)
      expect(page).to have_content(@leaves.title)
      # expect(page).to have_content(@leaves.cover_image)
      expect(page).to have_content(@omens.title)
      # expect(page).to has_xpath(@omens.cover_image)
      # page.has_xpath?('.//p[@id="foo"]')
    end

    it 'should sort reviews in asc order' do
      visit user_path('Bill')
      click_on "Sort by Least Recent"
      # within("#review-title") do
        expect(page.all('#review-title')[0]).to have_content("#{@r1.title}")
        expect(page.all('#review-title')[1]).to have_content("#{@r3.title}")
        expect(page.all('#review-title')[2]).to have_content("#{@r4.title}")
      # end
    end

    it 'should sort reviews in desc order' do
      visit user_path('Bill')
      click_on "Sort by Most Recent"
      # within("#review-title") do
        expect(page.all('#review-title')[0]).to have_content("#{@r4.title}")
        expect(page.all('#review-title')[1]).to have_content("#{@r3.title}")
        expect(page.all('#review-title')[2]).to have_content("#{@r1.title}")
      # end
    end

  end
end
