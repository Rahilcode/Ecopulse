class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :user_image
  has_many :posts, dependent: :destroy

  has_many :orders, dependent: :destroy
  has_many :services, through: :orders

  has_many :notifications, as: :recipient, dependent: :destroy

  has_many :ratings, dependent: :destroy


  validates :name, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :address, presence: true
  
end
