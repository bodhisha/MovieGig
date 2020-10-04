class RecommendedMoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    if !already_in_recommended?
      @movie = Movie.find(params[:movie_id])
      @movie.recommended_movies.create!(user_id: current_user.id)
      redirect_to movie_path(@movie)
      flash.notice = "Movie added to Recommended list"
    end
  end

  def destroy
    recommended_movie = current_user.recommended_movies.find(params[:id])
    recommended_movie.destroy!
    movie = recommended_movie.movie
    redirect_to movie_path(movie)
    flash.notice = "Movie removed from Recommended list"
  end

  private

  def already_in_recommended?
    RecommendedMovie.where(user_id: current_user.id, movie_id: params[:movie_id]).exists?
  end
end
