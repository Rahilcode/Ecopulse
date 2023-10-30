class ChangeTimeSlotTypeOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :time_slot, :string
  end
end
