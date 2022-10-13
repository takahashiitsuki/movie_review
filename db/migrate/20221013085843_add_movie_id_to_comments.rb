class AddMovieIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :Movie_id, :integer, null: false
  end
end
