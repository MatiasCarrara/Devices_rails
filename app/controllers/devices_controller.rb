class DevicesController < ApplicationController
  before_action :device_compare, only: %i[show edit update destroy]
  helper_method :current_user

  def index
    @device = current_user.devices
  end

  def show; end

  def new
    @device = Device.new
  end

  def edit; end

  def create
    @device = current_user.devices.create(device_params)

    if @device.save
      redirect_to user_device_path(@device.user_id, @device.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @device.update(device_params)
      redirect_to user_devices_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @device.destroy

    redirect_to user_devices_path
  end


  def current_user
    @current_user ||= User.find(params[:user_id])
  end

  private

    def device_params
      params.require(:device).permit(:name, :address)
    end

    def device_compare
      @device = Device.find(params[:id])
    end

end
