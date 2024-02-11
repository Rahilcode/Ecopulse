class NotifierMailer < ApplicationMailer
  default from: 'notifications@ecopulse.com'

  def order_email
    @user = params[:user]
    @order = params[:order]
    @service = params[:service]
    @company = params[:company]
    @flag = params[:flag]

    @url  = 'http://localhost:3000'

    if @flag == true
        mail(to: '', subject: 'Notification From Ecopulse')
    else 
        mail(to: @company.email, subject: 'Notification From Ecopulse')
    end
  end

  def post_email
    @user = params[:user]
    @post = params[:post]
    @company = params[:company]
    @flag = params[:flag]

    @url  = 'http://localhost:3000'

    if @flag == true
        mail(to: @user.email, subject: 'Notification From Ecopulse')
    else 
        mail(to: @company.email, subject: 'Notification From Ecopulse')
    end
  end
end
