class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @id = params[:id]
    @book = Book.find(@id)
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def book_params
    params.require(:book).permit(:title, :author, :price_cents, :quantity, :description)
  end
end
