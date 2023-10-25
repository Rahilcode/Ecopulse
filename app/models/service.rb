class Service < ApplicationRecord
  belongs_to :company
  has_one_attached :service_post_image

  validates :name, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :material, presence: true
end
