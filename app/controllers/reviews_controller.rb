class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create!(review_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    review = current_user.reviews.find(params[:id])
    movie = review.movie
    review.destroy!
    redirect_to movie_path(movie)
  end

  private

  def review_params
    params.require(:review).permit(:review, :rating).merge(user_id: current_user.id)
  end
end
