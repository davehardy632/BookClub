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
    @reviews = @book.reviews
  end

  def new
    # begin
      @book = Book.new#(book_params)
    # rescue
    #   @book = Book.new
    # end
  end

  def create
    @title = book_params[:title].titleize
    @book = Book.new(book_params)
    @book.title = @title
    if @book.save
      @a_params = author_params[:name].split(',')
      @a_params.each do |name|
        name = Author.find_or_create_by(name: name.titleize)
        name.books << @book
      end
      redirect_to book_path(@book.id)
    else
      render :new#new_book_path#_book_path(book: {tile: @book.title})
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year, :cover_image)
  end

  def author_params
    params.require(:authors).permit(:name)
  end

end
