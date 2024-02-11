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
    @user = user
    OrderNotification.with(message: self, service: @service, company: @company).deliver_later(user)
    OrderNotification.with(message: self, service: @service, company: @company).deliver_later(@company)

    NotifierMailer.with(order: self, service: @service, company: @company, user: @user, flag: true).order_email.deliver_later
    # NotifierMailer.with(order: self, service: @service, company: @company, user: @user, flag: false).order_email.deliver_later
  end
end
