class ReviewtagsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review_tag = @review.review_tags.new(tag_params)
    @review_tag.tag_id = tag_params[:id]
    @review_tag.save
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    @review = Review.find(params[:review_id])
    
  end
  
  private
  
  def review_tag_params
    params.require(:review_tag).permit(:review, :tag)
  end
end
