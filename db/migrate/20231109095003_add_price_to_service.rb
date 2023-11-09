class AddPriceToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :price, :string
  end
end
