class SfilesController < ApplicationController
  def new
    @sfiles = Sfile.new
  end

  def create
    @sfile = Sfile.new(sfile_params)
    if @sfile.save
      redirect_to '/brainy/eugene', notice: "The file #{@sfile.name} has been uploaded."
    else
    end
  end

  def destroy
  end
  
  private 
    def sfile_params
      params.require(:sfile).permit(:name, :syncfile, :devid, :userid)
    end
end
