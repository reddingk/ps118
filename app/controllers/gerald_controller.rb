class GeraldController < ApplicationController
  def index
  end

  def arnold
    @device = Device.where("userid = ?", current_user.id)
    #Device.paginate(page: params[:page])
  end

  def sid
  end
  
  def construction
  end
end
