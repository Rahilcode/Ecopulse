class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :user_post_image

  validates :name, presence: true
  validates :title, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :material_type, presence: true
  validates :date, presence: true
  validates :time_slot, presence: true
end
