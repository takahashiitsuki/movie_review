class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :star, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
