class AddHiddenToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :hidden, :boolean, null:false, default: false
  end
end
