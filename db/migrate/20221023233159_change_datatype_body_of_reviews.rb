class ChangeDatatypeBodyOfReviews < ActiveRecord::Migration[6.1]
  def up
    change_column_null :reviews, :body, false
    change_column_null :reviews, :star, false
  end
end
