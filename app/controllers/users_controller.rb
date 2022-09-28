class UsersController < ApplicationController

  def new
    redirect_to articles_path and return if current_user
    user = User.new
  end

  def create
    user = User.new(
      email:params[:email],
      password:params[:password],
      password_confirmation:params[:password_confrrmation]
    )
    if user.save
      session[:user_id] = user.id
      redirect_to articles_path
    else  
      render :new
    end
  end
end
