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



  def user

    @user = Review
            .joins(:book)
            .select('reviews.*, books.cover_image, books.title as book_title')
            .where(user: params[:user]).entries
    # @sort_old = @user.sort_by{|review| review.created_at}
    # @sort_new = @user.sort_by{|review| review.created_at}.reverse
    end

  # def sort_old
  #   @user = Review
  #           .joins(:book)
  #           .select('reviews.*, books.cover_image, books.title as book_title')
  #           .where(user: params[:user]).entries
  #   @old_rev = @user.
  # end


  private

  def review_params
    params.require(:review).permit(:title, :user, :rating, :description)
  end
end
