class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about, :company_profile, :notification, :posts]
  before_action :authenticate_company!, only: [:company_profile, :posts]
  def home
  end

  def about
  end

  def profile
  end

  def company_profile
    @company = Company.find(current_company.id);
    @services = @company.services
  end

  def services
    @services = Service.all
  end

  def posts
    @posts = Post.where('date >= ?', Date.today).where(flag: false)
  end

  def notification
    if user_signed_in?
      @notifications = current_user.notifications.order("created_at DESC")
    elsif company_signed_in?
      @notifications = current_company.notifications.order("created_at DESC")
    end
  end

  private 
  def set_notifications_as_read
    if user_signed_in?
      notifications = current_user.notifications.unread
    elsif company_signed_in?
      notifications = current_company.notifications.unread
    end
    notifications.update_all(read_at: Time.zone.now)
  end

end
