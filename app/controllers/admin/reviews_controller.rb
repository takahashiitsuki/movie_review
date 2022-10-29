class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @review = Review.find(params[:id])
    @movie = JSON.parse((Tmdb::Movie.detail(@review.movie_id)).to_json)
    @comment = Comment.new
  end

  def index
    if params[:looking_for].present?
      if params[:range] == "タイトル"
        @reviews = Review.where("title LIKE ?", "%#{params[:looking_for]}%")
      else
        @users = User.where("name LIKE ?", "%#{params[:looking_for]}%")
        @reviews = Review.where(user_id: @users.ids)
      end
    else
      @reviews = Review.all
    end
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :body, :user_id, :movie_id)
  end
  
end
