class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = WatchedMovie.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :cover)
  end
end
