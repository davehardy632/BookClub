class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new
  end

  def create
    binding.pry
    @review = Review.create(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end



  private
  def review_params
    rp = params.permit(:reviews).permit(:title, :user, :rating, :description)
    rp[:user].titleize.strip!
    # User names should be converted to Title Case before saving.
  end

end
