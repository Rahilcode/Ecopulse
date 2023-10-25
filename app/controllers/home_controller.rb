class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about, :company_profile]
  def home
  end

  def about
  end

  def profile
  end

  def company_profile
  end

end
