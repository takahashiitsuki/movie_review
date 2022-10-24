class ChangeDatatypeBodyOfReviews < ActiveRecord::Migration[6.1]
  def up
    change_column_null :reviews, :body, true
    change_column_null :reviews, :star, true
  end
end
