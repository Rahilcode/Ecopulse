class AddFlagToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :flag, :boolean, default: false
  end
end
