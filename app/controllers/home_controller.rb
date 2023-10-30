class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about, :company_profile]
  before_action :authenticate_company!, only: [:company_profile]
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

end
