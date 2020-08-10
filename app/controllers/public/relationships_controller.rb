class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    @company = Company.find(follow.follower_id)
    follow.save
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @company = Company.find(follow.follower_id)
    follow.destroy
  end
end