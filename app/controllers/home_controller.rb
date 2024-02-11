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

    puts '-----------================---------------'
    puts params
    @search = params[:search]
    if @search && @search != ""
      @services = @services.where("lower(title) LIKE ?", "%#{@search}%")
    end

    @location = params[:location]
    if @location && @location != "" 
      @services = @services.where("lower(city) LIKE ?", @location)
    end

    @price = params[:price]
    puts @price
    p1 = 0;
    p2 = 0;
    if(@price == "1") 
      p1 = 0
      p2 = 99
    elsif(@price == "2") 
      p1 = 100
      p2 = 299
     elsif(@price == "3") 
      p1 = 300
      p2 = 599
     else 
      p1 = 600
      p2 = 100000
    
  end
    if @price && @price != "" 
      puts p1
      puts p2
      @services = @services.where("CAST(price AS INT) BETWEEN ? AND ?", p1, p2)
    end

    @rating = params[:rating]
    if @rating && @rating != "" 
      @services = @services.where("avg_rating LIKE ?", @rating)
    end
    
  end

  def filter 
    puts "filterfilterfilterfilter"
    puts params
    redirect_to :controller => 'home', :action => 'services',:search => params[:search], :location => params[:location],
      :price => params[:price], :rating => params[:rating]
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
