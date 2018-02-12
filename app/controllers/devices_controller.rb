class DevicesController < ApplicationController

  def index
    @device = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to @device
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def device_params
      params.require(:device).permit(:name, :address)
    end

end
