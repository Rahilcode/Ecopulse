class ServicesController < ApplicationController
  before_action :authenticate_company!
  before_action :set_service, only: %i[ show edit update destroy ]

  # GET /services or /services.json
  def index
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

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)
    @service.company_id = current_company.id

    respond_to do |format|
      if @service.save
        format.html { redirect_to company_profile_path, notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to company_profile_path, notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to company_profile_path, notice: "Service was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def filter 
    puts "filterfilterfilterfilter"
    puts params
    redirect_to :controller => 'services', :action => 'index',:search => params[:search], :location => params[:location],
      :price => params[:price], :rating => params[:rating]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :title, :phone_number, :price, :city, :material, :description, :service_post_image)
    end
end
