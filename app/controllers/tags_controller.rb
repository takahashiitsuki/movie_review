class TagsController < ApplicationController
  def create
    unless Tag.find_by(name: params(:name))
      @review_tag = Review_tag.new
      @tag = Tag.new(tag_params)
      
    end
  end

  def destroy
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
