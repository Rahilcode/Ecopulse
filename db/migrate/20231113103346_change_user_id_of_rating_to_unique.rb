class ChangeUserIdOfRatingToUnique < ActiveRecord::Migration[7.0]
  def change
    change_column :ratings, :user_id, :integer, unique: true
  end
end
