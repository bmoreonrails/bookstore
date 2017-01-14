class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome back, #{user.username}!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = "Sorry, your username or password is invalid."
      render :new
    end
  end
end
