class ReviewsController < ApplicationController
  before_action :verify_user_session

  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build
  end

  def create
    book = Book.find(params[:book_id])
    book.reviews.create(review_params)
    redirect_to book_path(book)
  end

  def review_params
    params.require(:review).permit(:body, :user_id)
  end

  def verify_user_session
    if session[:user_id].blank?
      flash[:alert] = 'Please login before continuing'
      redirect_to new_session_path
    end
  end
end
