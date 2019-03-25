class ReviewsController < ApplicationController

  def new
    @books = Book.find(params[:book_id])
    @reviews = @books.reviews.new
  end

  def create
    @book = Book.find(params[:book_id])
    rp = review_params
    rp[:user] = rp[:user].titleize
    @review = @book.reviews.create(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def user_show
    if params[:sort] == 'asc'
      @user = Review.least_recent(params[:user])
    elsif params[:sort] == 'desc'
      @user = Review.most_recent(params[:user])
    else
      @user = Review.user(params[:user])
    end
  end

  def destroy
    r = Review.find(params[:id])
    user = r.user
    r.delete
    redirect_to user_path(user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :user, :rating, :description, :sort)
  end
end
