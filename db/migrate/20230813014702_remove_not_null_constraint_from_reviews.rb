class RemoveNotNullConstraintFromReviews < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reviews, :title, true
    change_column_null :reviews, :body, true
  end
end
