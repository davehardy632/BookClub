class ReviewsController < ApplicationController

  def new
    @books = Book.find(params[:book_id])
    @reviews = @books.reviews.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def user
    Reviews
        .joins(:book)
        .select('reviews.*, books.title as book_title, book.cover_image')
        .where(user: params[:user])
        .entries
  end


  private

  def review_params
    rp = params.permit(:review).permit(:title, :user, :rating, :description)
    rp[:user].titleize.strip!

    # User names should be converted to Title Case before saving.
  end

end
