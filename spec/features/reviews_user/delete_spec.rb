require 'rails_helper'
RSpec.describe 'As a Visitor' do
  describe 'When I visit a users show page' do
    it 'I see a link next to each review to delete the review' do
      terry = Author.create(name:"Terry")
      book1 = terry.books.create(title:"Houses",pages:300, year:1984)
      book2 = terry.books.create(title:"Houses II",pages:300, year:1985)
      review1 = book1.reviews.create(title: "good reads", rating:5, description:"fun, interesting and good", user:"Tim")
      review2 = book2.reviews.create(title: "better reads", rating:5, description:"fun, interesting and better than the first one", user:"Tim")
      visit user_path("Tim")

      within ".user-info-#{review1.id}" do
        within ".remove" do
          click_on "Delete Review"
        end
      end
        expect(current_path).to eq(user_path("Tim"))
        expect(page).to_not have_content(review1.title)
    end
  end
end
