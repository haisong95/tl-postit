class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to Damenotes!"
      redirect_to root_path
    else
      flash[:error] = "There are something wrong with your username or password!"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logout"
    redirect_to root_path
  end
end