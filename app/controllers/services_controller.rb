class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update]
  before_action :expired?

  # GET /services
  # GET /services.json
  def index
    @services = current_user.services.page(params[:page])
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.user = current_user

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = current_user.services.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :service_id, :authentication_token, :user_id)
    end
end
