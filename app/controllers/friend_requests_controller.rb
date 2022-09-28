class FriendRequestsController < ApplicationController

  before_action :authenticate_user!  

  def index
    # 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
    @friend_request = Friendship.where(sent_to_id: current_user.id)
  end

  def accept_friend
    request = Friendship.find params[:request]
    request.status = params[:status]
    if request.save
      flash[:success] = 'Friend Request Accepted'
    else
      flash[:danger] = 'Friend Request could not be accepted'
    end
    redirect_to friend_requests_path
  end

  # def decline_friend
  #   request = Friendship.find params[:request]
  #   request.status = false
  #   if request.save
  #     flash[:success] = 'Friend Request Declined'
  #   else
  #     flash[:danger] = 'Friend Request could not be accepted'
  #   end
  #   redirect_to friend_requests_path
  # end

end
