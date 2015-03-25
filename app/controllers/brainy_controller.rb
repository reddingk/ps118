class BrainyController < ApplicationController
  def index
  end

  def eugene
     @device = Device.where("userid = ?", current_user.id)
     @sfile = Sfile.all
     @sfile_u = Sfile.new
  end
  
  def create
    @sfile = Sfile.new(sfile_params)
    if @sfile.save
      redirect_to '/gerald/arnold', notice: "The file #{@sfile.name} has been uploaded."
    else
    end
  end
  
  private 
    def sfile_params
      params.require(:sfile).permit(:name, :syncfile, :devid, :userid)
    end
end
