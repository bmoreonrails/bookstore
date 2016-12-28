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
    Book.create(title: params[:book][:title], author: params[:book][:author], price_cents: params[:book][:price_cents], quantity: params[:book][:quantity], description: params[:book][:description])
  end
end
