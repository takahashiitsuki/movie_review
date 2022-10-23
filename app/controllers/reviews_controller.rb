class ReviewsController < ApplicationController
  before_action :authenticate_user!,only: [:new]

  def new
    @user = current_user
    @movie = JSON.parse((Tmdb::Movie.detail(params[:movie_id])).to_json)
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
    @comment = Comment.new
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

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end
  
  def hidden
    review = Review.find(params[:id])
    review.hidden = true
    review.save
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :star, :body, :movie_id)
  end

end
