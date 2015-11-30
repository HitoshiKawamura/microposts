class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "update your profile!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end
  
  def follow
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end
  
  def unfollow
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
