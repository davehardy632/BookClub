require 'rails_helper'
RSpec.describe 'As a Visitor' do
  describe 'When I visit a users show page' do
    it 'I see a link next to each review to delete the review' do
      terry = Author.create(name:"Terry")
      book = terry.books.create(title:"Houses",pages:300, year:1984)
      review = book.reviews.create(title: "good reads", rating:5, description:"fun, interesting and good", user:"Tim")
      visit user_path("Tim")

      click_on "Delete Review"
      expect(current_path).to eq(user_path("Tim"))
      expect(page).to_not have_content(review.title)
    end
  end
end
