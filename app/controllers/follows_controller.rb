class FollowsController < ApplicationController
  def create
    Follow.create!(follow_params)
    
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    follow = Follow.find_by(id: params[:id])
    follow&.destroy
    
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def follow_params
    params.expect(follow: [:follower_user_id, :followed_user_id])
  end
end
