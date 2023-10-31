class Order < ApplicationRecord
  belongs_to :user
  belongs_to :service

  after_create_commit :notify_recipient
  
  validates :name, presence: true
  validates :date, presence: true
  validates :time_slot, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: true

  private

  def notify_recipient
    @service = Service.find(self.service_id)
    @company = Company.find(@service.company_id)
    OrderNotification.with(message: self, service: @service, company: @company).deliver_later(user)
    OrderNotification.with(message: self, service: @service, company: @company).deliver_later(@company)
  end
end
