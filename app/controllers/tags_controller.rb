class TagsController < ApplicationController
  def create
    if @tag = Tag.find_by(name: params[:tag][:name])
      unless ReviewTag.find_by(tag_id: @tag.id, review_id: nil)
        # @review_tag = ReviewTag.new(tag_id: @tag.id)
        @review_tag = ReviewTag.new()
        @review_tag.tag_id = @tag.id
        @review_tag.save
      end
    else
      @tag = Tag.new(tag_params)
      @tag.save
      @review_tag = ReviewTag.new(tag_id: @tag.id)
      @review_tag.save
    end
    # @tag = Tag.new(tag_params)
    # @tag.save
    # @tags << @tag
    @tags = ReviewTag.where(review_id: nil)
    render :list
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
