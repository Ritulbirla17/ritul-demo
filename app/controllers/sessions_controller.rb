class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:create, :new]

  def new
    redirect_to articles_path and return if current_user
    user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully Logged In!'
      redirect_to articles_path
    else
      flash[:warning] = 'Invalid Email or Password'
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have Successfully Logged Out!'
    redirect_to login_path
  end

end