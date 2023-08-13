class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    Comment.find(params[:id]).destroy
    @review = Review.find(params[:review_id])

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
