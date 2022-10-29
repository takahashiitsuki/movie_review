class TagsController < ApplicationController
  def create
    @review = Review.find(params(:review_id))
    unless Tag.find_by(name: params(:name))
      @tag = Tag.new(tag_params)
      @review_tag = @tag.Review_tag.new(params(:review_id))
      @tags = Review(params(:review_id)).review_tag.all
    end
  end

  def destroy
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
