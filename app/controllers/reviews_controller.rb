class ReviewsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def new
    @user = current_user
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to review_path(@review.id)
  end

  def show
    @review = Review.find(params[:id])
    @movie = JSON.parse((Tmdb::Movie.detail(@review.movie_id)).to_json)
  end

  def index
    @reviews = Review.all
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :body, :user_id, :movie_id)
  end

end
