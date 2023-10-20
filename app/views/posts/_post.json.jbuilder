json.extract! post, :id, :name, :title, :city, :address, :material_type, :description, :date, :time_slot, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
