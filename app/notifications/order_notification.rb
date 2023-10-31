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
  #
  # def url
  #   post_path(params[:post])
  # end
end
