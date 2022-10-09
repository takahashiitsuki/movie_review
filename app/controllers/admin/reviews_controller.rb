class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @review = Review.find(params[:id])
    @movie = JSON.parse((Tmdb::Movie.detail(@review.movie_id)).to_json)
  end

  def index
    if params[:looking_for].present?
      @reviews = Review.where("title LIKE ?", "%#{params[:looking_for]}%")
    else
      @reviews = Review.all
    end
  end

  def search
    if params[:looking_for].present?
      @reviews = Review.where("name LIKE ?", "%#{words}%")
    else
      @reviews = Review.all
    end
  end
  
  def edit
      @review = Review.find(params[:id])
  end
  
  def update
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :body, :user_id, :movie_id)
  end
  
end
