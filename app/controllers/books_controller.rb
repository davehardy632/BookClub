class BooksController < ApplicationController
  def index
    if params[:sort] == 'pages'
      @books = Book.sort_pages(params[:order])
    elsif params[:sort] == 'reviews'
      @books = Book.sort_reviews(params[:order])
    elsif params[:sort] == 'rating'
      @books = Book.sort_rating(params[:order])
    else
      @books = Book.all
    end
    @most_active_user = Review.most_active_user
    @highest_rated = Book.highest_rated
    @lowest_rated = Book.lowest_rated
  end

  def show
    @book = Book.find(params[:id])
  end

end
