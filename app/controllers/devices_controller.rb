class DevicesController < ApplicationController
  before_action :device_compare, only: %i[show edit update destroy]

  def index
    @device = Device.all
  end

  def show
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to @device
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @device.update(device_params)
      redirect_to @device
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @device.destroy

    redirect_to devices_path
  end

  private

    def device_params
      params.require(:device).permit(:name, :address)
    end

    def device_compare
      @device = Device.find(params[:id])
    end
end
