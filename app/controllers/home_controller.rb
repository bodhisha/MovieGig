class HomeController < ApplicationController
  def index
    @movies = Movie.all
    most_watched_movie_ids = WatchedMovie.all.group("movie_id").count.sort_by { |movie, count| -count }.first(3).to_h
    @sorted_most_watched_movies = Movie.where(id: most_watched_movie_ids.keys)
  end
end
