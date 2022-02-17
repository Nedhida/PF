class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]
  before_action :login_check

  def show
    @user = User.find(params[:id])
    @variablecost_values = @user.variablecost_values.page(params[:page]).reverse_order
  end

  def index
    @user = current_user
    @users = User.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

   #フォロー一覧
  def following
    @users = User.find(params[:id])
    @user = @users.following
    render 'relationships/following'
  end

  #フォロワー一覧
  def followers
    @users = User.find(params[:id])
    @user = @users.followers
    render 'relationships/followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

end
