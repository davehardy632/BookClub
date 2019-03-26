class AuthorsController < ApplicationController


  def show
    @author = Author.find(params[:id])
  end

  def destroy
    binding.pry
    book_ids = Author.find(params[:id]).books.pluck(:id)
    book_ids.each do |id|
      Review.where(book_id: id).destroy_all
      BookAuthor.where(book_id: id).destroy_all
      book = Book.find(id).destroy #if book.authors.count ==1
    end
    Author.find(params[:id]).destroy
    redirect_to books_path
  end

end
