class ChangePostTimeSlotTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :time_slot, :string
  end
end
