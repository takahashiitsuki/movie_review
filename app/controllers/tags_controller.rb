class TagsController < ApplicationController
  def create
    @review = Review.find(params(:review_id))
    if @tag = Tag.find_by(name: params(:name))
      unless @review.Review_tag.find_by(tag_id: @tag.id)
        @review_tag = @review.Review_tag.new(params())
        @review_tag.save
        @tags = Review(params(:review_id)).review_tag.all
      end
    else
      @tag = Tag.new(tag_params)
      @tag.save
      @review_tag = @tag.Review_tag.new(params(:review_id))
      @review_tag.save
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
