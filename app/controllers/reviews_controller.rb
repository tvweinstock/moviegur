class ReviewsController < ApplicationController
  before_filter :load_movie
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to movies_path, notice: 'Review created successfully'
    else
      render 'movies/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment, :movie_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end