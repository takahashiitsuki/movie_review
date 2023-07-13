class ReviewForm
  include ActiveModel::Model

  attr_accessor :title, :body, :star, :movie_id, :user_id
  attr_reader :tags

  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true
  validates :movie_id, presence: true
  
  def tags=(tag_names)
    @tags = tag_names.split(',')
  end
  
  def save
      # レビューの保存ロジック
      review = Review.new(title: @review.title, body: @review.body, star: @review.star, movie_id: @review.movie_id, user_id: @review.user_id)
      review.save
  end


end