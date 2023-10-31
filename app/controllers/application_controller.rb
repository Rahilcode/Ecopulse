class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :countNotifications

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number address user_image])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name phone_number address user_image])
    elsif resource_class == Company
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[company_name company_address company_phone_number company_description company_city company_image])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[company_name company_address company_phone_number company_description company_city company_image])
    end 
  end

  def countNotifications
    if user_signed_in?
      @notify = current_user.notifications.unread.count
    elsif company_signed_in?
      @notify = current_company.notifications.unread.count
    else 
      @notify = 0
    end
    puts "============================================ Notify"
    puts @notify
  end
end
