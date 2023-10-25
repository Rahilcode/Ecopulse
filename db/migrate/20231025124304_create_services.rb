class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :title
      t.string :phone_number
      t.string :city
      t.string :material
      t.text :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
