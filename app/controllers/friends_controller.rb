class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friendships = Friendship.all
  end
  def new
    @friends = Friendship.new
  end
  
  def create
    @friends = current_user.friend_sent.build(sent_to_id: params[:sent_to_id])
    if @friends.save
      flash[:success] = 'Friend Request Sent!'
    else
      flash[:danger] = 'Friend Request Failed!'
    end
    redirect_to friends_path
  end

end
