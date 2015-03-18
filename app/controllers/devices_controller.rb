class DevicesController < ApplicationController
  def new
    @device = Device.new
  end
  
  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:success] = @device.name + " has been added to your PS-118 Domain"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  private

    def device_params
      params.require(:device).permit(:name, :dev_type, :userid)
    end

  
end
