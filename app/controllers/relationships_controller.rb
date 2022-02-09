class RelationshipsController < ApplicationController

  #フォローする
  def create
    user = User.find(params[:user_id])
    current_user.follow(user.id)
    redirect_back(fallback_location: root_path)
  end

   #フォローを外す
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user.id)
    redirect_back(fallback_location: root_path)
  end

  #フォロー一覧
  def following
    @users = User.find(params[:user_id])
    @user = @users.following
  end

  #フォロワー一覧
  def followers
    @user = User.find(params[:user_id])
    @user = @users.followers
  end

end
