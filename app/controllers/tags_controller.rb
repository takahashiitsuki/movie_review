class TagsController < ApplicationController
  def create
    if Tag.find_by(params[:name])
      @tag = Tag.find_by(params[:name])
      unless @review_tag
        @tags.push(@tag)
      end
    else
      @tag = Tag.new(params[:name])
      @tag.save
      @review_tag = Review_tag.new(tag_id: @tag.id)
      @review_tag.save
      @tags.push(@tag)
    end
    # @tag = Tag.new(tag_params)
    # @tag.save
    # @tags << @tag
    render 'tags/list'
  end

  def destroy
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
