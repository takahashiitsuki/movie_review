class ChangeDatatypeNameOfTags < ActiveRecord::Migration[6.1]
  def change
    change_column :tags, :name, :string, null:false, unique: true
  end
end
