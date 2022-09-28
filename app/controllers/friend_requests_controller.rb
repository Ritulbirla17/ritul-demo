class FriendRequestsController < ApplicationController

  before_action :authenticate_user!  

  def index
    @friend_request = Friendship.all
  end

  def accept_friend
    @friend_request = Friendship.find_by(sent_by_id: params[:sent_by_id], 
      sent_to_id: current_user.id, status: false)
    @friend_request.status = true
    if @friend_request.save
      flash[:success] = 'Friend Request Accepted'
    else
      flash[:danger] = 'Friend Request could not be accepted'
    end
    redirect_to friend_request_path
  end

  def decline_friend
    @friend_request = Friendship.find_by(sent_by_id: params[:sent_by_id], 
      sent_to_id: current_user.id, status: false)
    @friend_request.destroy
    flash[:success] = 'Friend Request Declined'
    redirect_to friend_request_path
  end

end
