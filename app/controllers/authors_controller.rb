class AuthorsController < ApplicationController


  def show
    @author = Author.find(params[:id])
  end

  def destroy
    book_ids = BookAuthor.where(author_id: params[:id]).pluck(:book_id)
    Review.where(book_id: book_ids).destroy_all
    author = params[:id]
    ba = Book.joins(:book_authors).where('book_authors.author_id = ?',author)
    ba.destroy_all

    redirect_to books_path
  end
end
