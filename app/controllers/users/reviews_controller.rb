class Users::ReviewsController < ApplicationController
  def new
    @movie = JSON.parse((Tmdb::Movie.detail(params[:id])).to_json)

  end

  def create
    review = Review.new(review_params)
    review.save
    redirect_to root_path
  end

  def show
  end

  def index
  end

  def destroy
  end
end
