class WishListsController < ApplicationController
  before_action :authenticate_user!

  def create
    if !already_in_wish?
      @movie = Movie.find(params[:movie_id])
      @movie.wish_lists.create!(user_id: current_user.id)
      redirect_to movie_path(@movie)
      flash.notice = "Movie added to Watch list"
    end
  end

  def destroy
    wish_list_movie = current_user.wish_lists.find(params[:id])
    wish_list_movie.destroy!
    movie = wish_list_movie.movie
    redirect_to movie_path(movie)
    flash.notice = "Movie removed from Watch list"
  end

  private

  def already_in_wish?
    WishList.where(user_id: current_user.id, movie_id: params[:movie_id]).exists?
  end
end
