class WatchedMoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    if !already_watched?
      @movie = Movie.find(params[:movie_id])
      @movie.watched_movies.create!(user_id: current_user.id)
      redirect_to movie_path(@movie)
      flash.notice = "Movie added to Watched list"
    end
  end

  def destroy
    watched_movie = current_user.watched_movies.find(params[:id])
    watched_movie.destroy!
    movie = watched_movie.movie
    redirect_to movie_path(movie)
    flash.alert = "Movie removed from Watched list"
  end

  private

  def already_watched?
    WatchedMovie.where(user_id: current_user.id, movie_id: params[:movie_id]).exists?
  end
end
