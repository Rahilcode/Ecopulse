class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @order = Order.new
    @service = Service.find(params[:service_id])
    puts @service.inspect
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.service_id = params[:service_id]
    @order.user_id = current_user.id
    @service = Service.find(params[:service_id])

    respond_to do |format|
      if @order.save
        format.html { redirect_to service_order_path(@service, @order), notice: "Order was successfully Placed." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity } 
        puts @order.errors
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :phone_number, :date, :time_slot, :message, :user_id, :service_id)
  end
end
