class CommentsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_params)
    comment.movie_id = movie.id
    comment.save
    @movie=Movie.find(params[:book_id])
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    @review=Review.find(params[:movie_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
