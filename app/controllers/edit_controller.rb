class EditController < ApplicationController
  def new
    @user = User.new
    if @user.save
      flash[:success] = "Update your profile!"
      redirect_to @user
    else
      render 'new'
    end
  end
end