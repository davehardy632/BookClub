class BooksController < ApplicationController
  def index
    @books = Book.all
    # binding.pry
    # @average_rating = @books.average_rating
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    # @author = @book.authors.create(params[:name])
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
    render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :year, :cover_image)
  end

  def author_params
    params.require(:authors).permit(:name)
  end

end
