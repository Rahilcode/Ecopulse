class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :company_image
  has_many :services, dependent: :destroy

  validates :company_name, presence: true
  validates :company_phone_number, presence: true, numericality: true
  validates :company_address, presence: true
  validates :company_city, presence: true
end
