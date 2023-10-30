class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :name, presence: true
  validates :date, presence: true
  validates :time_slot, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: true
end
