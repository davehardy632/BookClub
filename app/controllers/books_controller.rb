class BooksController < ApplicationController
  def index
    @books = Book.all
    # binding.pry
    # @average_rating = @books.average_rating
  end

  def show
    @book = Book.find(params[:id])
  end

end

# As a Visitor,
# When I visit a book's show page,
# I see the following book information:
# - the book title
# - the author(s) who wrote the book
# - the number of pages in the book
# - the year the book was published
# - a large image of the book cover
#
# I also see a list of reviews for that book.
# Each review will have a title and user, a numeric rating
# from 1 to 5, and text for the review itself, and all content
# must be present for each review.
