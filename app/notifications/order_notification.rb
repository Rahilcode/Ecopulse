# To deliver this notification:
#
# OrderNotification.with(post: @post).deliver_later(current_user)
# OrderNotification.with(post: @post).deliver(current_user)

class OrderNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    if params[:flag]
      @company = params[:company]
      @user = params[:user]
      @post = params[:post]
      if @record.recipient_type == "User"
        "You have request for #{@post.title} on #{@post.date} at #{@post.time_slot} from #{@company.company_name}"
      elsif @record.recipient_type == "Company"
        "You have requested an order to #{@user.name} on #{@post.date} at #{@post.time_slot} for #{@post.title}"
      end
    else
      @order = params[:message]
      @com = params[:company]
      if @record.recipient_type == "User"
        puts "---------------------------------------user"
        "You have Placed order on #{@order.date} at #{@order.time_slot} to #{@com.company_name}"
      elsif @record.recipient_type == "Company"
        puts "=========================================someone"
        "You have an order on #{@order.date} at #{@order.time_slot} for #{@order.name}"
      end
    end
  end
  #
  # def url
  #   post_path(params[:post])
  # end
end
