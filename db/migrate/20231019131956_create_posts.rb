class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.string :city
      t.string :address
      t.string :material_type
      t.text :description
      t.date :date
      t.time :time_slot
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
