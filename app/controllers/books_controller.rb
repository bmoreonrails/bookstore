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
    Book.create(params.require(:book).permit(:title, :author, :price_cents, :quantity, :description))
    redirect_to books_path
  end

  def edit
  end
end
