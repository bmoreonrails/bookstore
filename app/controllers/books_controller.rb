class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @id = params[:id]
  end
end
